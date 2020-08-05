//
//  ViewController.swift
//  WeatherForecast
//
//  Copyright © 2020 Giftbot. All rights reserved.
//

import UIKit
import CoreLocation

final class WeatherCasterViewController: UIViewController, UIScrollViewDelegate {
    
    let backgroundImageView = UIImageView()
    let backImage = ["sunny", "cloudy", "lightning", "rainy"]
    let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.dark)
    lazy var blurEffectView = UIVisualEffectView(effect: blurEffect)
    
    let localStack = UIStackView()
    let cityLabel = UILabel()
    let timeLabel = UILabel()
    var timer = Timer()
    var formatter = DateFormatter()
    
    let refreshButton = UIButton(type: .system)
    
    let scrollView = UIScrollView()
    
    let tempLabel = UILabel()
    
    let tempStack = UIStackView()
    let minTemp = UILabel()
    let maxTemp = UILabel()
    
    let dayInfoStack = UIStackView()
    let dayImage = UIImageView()
    let dayLabel = UILabel()
    
    let weatherTable = UITableView()
    
    var regulateLayout: NSLayoutConstraint?
    var dayInfoStackLayout: NSLayoutConstraint?
    var tempStackLayout: NSLayoutConstraint?
    var tempLabelLayout: NSLayoutConstraint?
    var loadWeatherData: DaysWeatherData?
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        regulateLayout?.constant -= view.safeAreaInsets.top
        scrollView.contentSize = CGSize(width: view.frame.width, height: weatherTable.frame.maxY)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadDataToday()
        
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.frame = CGRect(x: 0, y: 0, width: view.frame.width + 20, height: view.frame.height)
        backgroundImageView.image = UIImage(named: backImage.randomElement() ?? "")
        view.addSubview(backgroundImageView)
        
        blurEffectView.frame = CGRect(x: 0, y: 0,
                                      width: backgroundImageView.frame.width + 20,
                                      height: backgroundImageView.frame.height)
        blurEffectView.alpha = 0
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        backgroundImageView.addSubview(blurEffectView)
        
        cityLabel.textColor = .white
        cityLabel.font = .boldSystemFont(ofSize: 17)
        
        timeLabel.textColor = .white
        formatter.dateFormat = "a h:mm"
        timeLabel.text = formatter.string(from: Date())
        timeLabel.font = .systemFont(ofSize: 14)
        
        timer = Timer.scheduledTimer(timeInterval: 1,
                                     target: self,
                                     selector: #selector(timeShow),
                                     userInfo: nil,
                                     repeats: true
        )
        
        localStack.alignment = .center
        localStack.axis = .vertical
        localStack.spacing = 5
        localStack.addArrangedSubview(cityLabel)
        localStack.addArrangedSubview(timeLabel)
        view.addSubview(localStack)
        
        let symbol = UIImage(systemName: "arrow.clockwise")
        refreshButton.frame.size = CGSize(width: 30, height: 30)
        refreshButton.tintColor = .white
        refreshButton.addTarget(self, action: #selector(beforerefresh(_:)), for: .touchDown)
        refreshButton.addTarget(self, action: #selector(refreshToggle(_:)), for: .touchUpInside)
        refreshButton.setImage(symbol, for: .normal)
        view.addSubview(refreshButton)
        
        scrollView.delegate = self
        scrollView.alwaysBounceVertical = true
        view.addSubview(scrollView)
        
        tempLabel.textColor = .white
        tempLabel.font = .systemFont(ofSize: view.frame.width / 3, weight: .ultraLight)
        scrollView.addSubview(tempLabel)
        
        minTemp.textColor = .white
        
        maxTemp.textColor = .white
        
        tempStack.alignment = .leading
        tempStack.axis = .horizontal
        tempStack.distribution = .fillEqually
        tempStack.spacing = 5
        tempStack.addArrangedSubview(minTemp)
        tempStack.addArrangedSubview(maxTemp)
        scrollView.addSubview(tempStack)
        
        dayImage.contentMode = .scaleAspectFit
        
        dayLabel.textColor = .white
        
        dayInfoStack.alignment = .bottom
        dayInfoStack.axis = .horizontal
        dayInfoStack.distribution = .fillEqually
        dayInfoStack.spacing = 5
        dayInfoStack.addArrangedSubview(dayImage)
        dayInfoStack.addArrangedSubview(dayLabel)
        scrollView.addSubview(dayInfoStack)
        
        weatherTable.rowHeight = 65
        weatherTable.separatorStyle = .none
        weatherTable.backgroundColor = .clear
        weatherTable.allowsSelection = false
        weatherTable.dataSource = self
        weatherTable.register(CustomTableViewCell.self, forCellReuseIdentifier: "Cell")
        scrollView.addSubview(weatherTable)
        
        setLayout()
    }
    
    func loadDataToday() {
        let apiurl = "\(UrlBase.urlToday)lat=\(UrlBase.lat)&lon=\(UrlBase.lon)&appid=\(UrlBase.appid)&lang=\(UrlBase.lang)"
        guard let urlJson = URL(string: apiurl) else { return print("error") }
        let dataTask = URLSession.shared.dataTask(with: urlJson) { data, response, error in
            guard error == nil else {return print(error!)}
            guard let response = response as? HTTPURLResponse,
                (200 ..< 400).contains(response.statusCode) else { return }
            guard let data = data else { return print ("No Data") }
            let jsonDecoder = JSONDecoder()
            do {
                let weatherData = try jsonDecoder.decode(TodayWeatherData.self, from: data)
                let dayLabelText = weatherData.weather[0].description
                    .replacingOccurrences(of: "온", with: "")
                    .replacingOccurrences(of: "실 ", with: "")
                    .replacingOccurrences(of: "튼", with: "")
                DispatchQueue.main.async {
                    self.cityLabel.text = weatherData.name
                    self.tempLabel.text = String(format: "%.1f°", weatherData.main.temp - 273.15)
                    self.minTemp.text = String(format: "⤓ %.1f°", weatherData.main.temp_min - 273.15)
                    self.maxTemp.text = String(format: "⤒ %.1f°", weatherData.main.temp_max - 273.15)
                    self.dayImage.image = UIImage(named: weatherData.weather[0].icon)
                    self.dayLabel.text = dayLabelText
                }
            } catch {
                print ("error: \(error)")
            }
        }
        dataTask.resume()
    }
    func loadDataDays(complitionHandler: @escaping (DaysWeatherData) -> Void) {
        let apiurl = "\(UrlBase.urlDays)lat=\(UrlBase.lat)&lon=\(UrlBase.lon)&appid=\(UrlBase.appid)&lang=\(UrlBase.lang)"
            guard let urlJson = URL(string: apiurl) else { return print("error") }
            let dataTask = URLSession.shared.dataTask(with: urlJson) { data, response, error in
                guard error == nil else {return print(error!)}
                guard let response = response as? HTTPURLResponse,
                    (200 ..< 400).contains(response.statusCode) else { return }
                guard let data = data else { return print ("No Data") }
                let jsonDecoder = JSONDecoder()
                do {
                    let weatherData = try jsonDecoder.decode(DaysWeatherData.self, from: data)
                    self.loadWeatherData = weatherData
                    complitionHandler(weatherData)
                } catch {
                    print ("error: \(error)")
                }
            }
            dataTask.resume()
            }
    func setLayout() {
        
        localStack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            localStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            localStack.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor)
        ])
        
        refreshButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            refreshButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            refreshButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,
                                                    constant: view.frame.width * 0.95)
        ])
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: localStack.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        tempLabel.translatesAutoresizingMaskIntoConstraints = false
        tempLabelLayout = tempLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 10)
        tempLabelLayout?.isActive = true
        regulateLayout = tempLabel.bottomAnchor.constraint(equalTo: scrollView.topAnchor, constant: (view.frame.height * 0.95))
        regulateLayout?.isActive = true
        
        tempStack.translatesAutoresizingMaskIntoConstraints = false
        tempStackLayout = tempStack.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 10)
        tempStackLayout?.isActive = true
        NSLayoutConstraint.activate([
            tempStack.bottomAnchor.constraint(equalTo: tempLabel.topAnchor, constant: -5)
        ])
        
        dayImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            dayImage.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.1),
            dayImage.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.1)
        ])
        
        dayInfoStack.translatesAutoresizingMaskIntoConstraints = false
        dayInfoStackLayout = dayInfoStack.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 10)
        dayInfoStackLayout?.isActive = true
        NSLayoutConstraint.activate([
            dayInfoStack.bottomAnchor.constraint(equalTo: tempStack.topAnchor, constant: -5)
        ])
        
        weatherTable.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            weatherTable.topAnchor.constraint(equalTo: tempLabel.bottomAnchor),
            weatherTable.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            weatherTable.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            weatherTable.heightAnchor.constraint(equalToConstant: 30 * 65)
        ])
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard scrollView.contentOffset.y < 500 else { return }
        backgroundImageView.center.x = view.center.x - (scrollView.contentOffset.y / 20)
        blurEffectView.alpha = scrollView.contentOffset.y / 750
    }
    @objc func timeShow() {
        timeLabel.text = formatter.string(from: Date())
    }
    @objc func beforerefresh(_ sender: UIBarButtonItem) {
        let refreshArr = [dayInfoStackLayout, tempStackLayout, tempLabelLayout]
        let width = view.frame.width
        loadDataToday()
        loadDataDays { (weatherData) in
            self.loadWeatherData = weatherData
            DispatchQueue.main.async {
                self.weatherTable.reloadData()
            }
        }
        
        blurEffectView.alpha = 1
        localStack.alpha = 0
        refreshArr.forEach {
            $0?.constant += width
        }
    }
    @objc func refreshToggle(_ sender: UIBarButtonItem) {
        let refreshArr = [dayInfoStackLayout, tempStackLayout, tempLabelLayout]
        let width = view.frame.width
        
        UIView.animate(withDuration: 0.75) {
            self.refreshButton.transform = CGAffineTransform(rotationAngle: .pi)
            self.refreshButton.transform = CGAffineTransform(rotationAngle: 0)
            self.blurEffectView.alpha = 0
            self.localStack.alpha = 1
            refreshArr.forEach {
                $0?.constant -= width
            }
            self.view.layoutIfNeeded()
        }
        backgroundImageView.image = UIImage(named: backImage.randomElement() ?? "")
        print("reload")
    }
}

extension WeatherCasterViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell",
                                                       for: indexPath) as? CustomTableViewCell else { fatalError() }
        loadDataDays { (weatherData) in
            DispatchQueue.main.async {
                let dateText = (Date(timeIntervalSince1970: weatherData.list[indexPath.row].dt))
                let cellDateFormatter = DateFormatter()
                cellDateFormatter.dateFormat = "M.d (E)"
                cell.dayLabel.text = cellDateFormatter.string(from: dateText)
                cellDateFormatter.dateFormat = "HH:mm"
                cell.timeLabel.text = cellDateFormatter.string(from: dateText)
                cell.dayImage.image = UIImage(named: self.loadWeatherData?.list[indexPath.row].weather[0].icon ?? "")
                cell.tempLabel.text = "\(Int(Double(self.loadWeatherData?.list[indexPath.row].main.temp ?? 0) - 273.15))°"
            }
        }
        return cell
    }
}
