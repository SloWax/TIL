//
//  DetailViewController.swift
//  Dominos11_Starter
//
//  Created by Lee on 2020/05/26.
//  Copyright © 2020 Kira. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var menuName:String = ""
    let constraint:CGFloat = 50
    var selectCount:Int = 0 {
        didSet { selectLabel.text = "\(selectCount) 개"}
    }
    let detailImage = UIImageView()
    
    let selectView = UIView()
    let selectLabel = UILabel()
    let minusButton = UIButton(type: .system)
    let plusButton = UIButton(type: .system)
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let value = Singleton.shared.wishList[menuName]
        value != nil ? (selectCount = value ?? 0) : (selectCount = 0)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        navigationItem.title = menuName
        
        
        detailImage.image = UIImage(named: menuName)
        view.addSubview(detailImage)
        
        view.addSubview(selectView)
        
        selectLabel.textAlignment = .center
        selectLabel.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        selectLabel.textColor = .white
        selectLabel.text = "\(selectCount) 개"
        selectView.addSubview(selectLabel)
        
        minusButton.layer.borderWidth = 3
        minusButton.layer.borderColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        minusButton.setTitle("-", for: .normal)
        minusButton.addTarget(self, action: #selector(countToggle(_:)), for: .touchUpInside)
        selectView.addSubview(minusButton)
        
        plusButton.layer.borderWidth = 3
        plusButton.layer.borderColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        plusButton.setTitle("+", for: .normal)
        plusButton.addTarget(self, action: #selector(countToggle(_:)), for: .touchUpInside)
        selectView.addSubview(plusButton)
        
        detailImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            detailImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: constraint),
            detailImage.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            detailImage.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            detailImage.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor)])
        
        selectView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            selectView.heightAnchor.constraint(equalToConstant: constraint),
            selectView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: constraint),
            selectView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -constraint),
            selectView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -constraint)
        ])
        
        minusButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            minusButton.topAnchor.constraint(equalTo: selectView.topAnchor),
            minusButton.leadingAnchor.constraint(equalTo: selectView.leadingAnchor),
            minusButton.widthAnchor.constraint(equalToConstant: constraint),
            minusButton.heightAnchor.constraint(equalToConstant: constraint)
        ])
        
        plusButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            plusButton.topAnchor.constraint(equalTo: selectView.topAnchor),
            plusButton.trailingAnchor.constraint(equalTo: selectView.trailingAnchor),
            plusButton.widthAnchor.constraint(equalToConstant: constraint),
            plusButton.heightAnchor.constraint(equalToConstant: constraint)
        ])
        
        selectLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            selectLabel.heightAnchor.constraint(equalToConstant: constraint),
            selectLabel.centerYAnchor.constraint(equalTo: selectView.centerYAnchor),
            selectLabel.leadingAnchor.constraint(equalTo: minusButton.trailingAnchor),
            selectLabel.trailingAnchor.constraint(equalTo: plusButton.leadingAnchor)
        ])
    }
    
    @objc func countToggle(_ sender: UIButton) {
        let sign = sender.titleLabel?.text ?? ""
        if selectCount == 0, sign == "-" {
            return
        } else {
            switch sign {
            case "+":
                selectCount += 1
            default :
                selectCount -= 1
            }
        }
        Singleton.shared.wishList[menuName] = selectCount
    }
}
