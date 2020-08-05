//
//  CustomTableViewCell.swift
//  WeatherForecast
//
//  Created by 표건욱 on 2020/07/23.
//  Copyright © 2020 Giftbot. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    let dayLabel = UILabel()
    let timeLabel = UILabel()
    let leftStack = UIStackView()
    
    let dayImage = UIImageView()
    let dayboder = UIView()
    
    let tempLabel = UILabel()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = .clear
        
        dayLabel.font = .systemFont(ofSize: contentView.frame.height * 0.4, weight: .light)
        dayLabel.textColor = .white
        
        timeLabel.font = .systemFont(ofSize: contentView.frame.height * 0.55, weight: .medium)
        timeLabel.textColor = .white
        
        leftStack.axis = .vertical
        leftStack.alignment = .leading
        leftStack.distribution = .fillEqually
        leftStack.addArrangedSubview(dayLabel)
        leftStack.addArrangedSubview(timeLabel)
        contentView.addSubview(leftStack)
        
        dayboder.backgroundColor = .white
        dayboder.layer.cornerRadius = 1
        dayboder.alpha = 0.3
        dayImage.addSubview(dayboder)
        contentView.addSubview(dayImage)
        
        tempLabel.font = .systemFont(ofSize: contentView.frame.height, weight: .thin)
        tempLabel.textColor = .white
        contentView.addSubview(tempLabel)
        
        setLayout()
    }
    
    func setLayout() {
        leftStack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            leftStack.topAnchor.constraint(equalTo: contentView.topAnchor),
            leftStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10)
        ])
        
        dayImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        dayImage.centerXAnchor.constraint(equalTo: contentView.leadingAnchor,
                                          constant: contentView.frame.width * 0.7),
        dayImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
        dayImage.widthAnchor.constraint(equalToConstant: contentView.frame.width * 0.125),
        dayImage.heightAnchor.constraint(equalTo: dayImage.widthAnchor)
        ])
        
        dayboder.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            dayboder.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            dayboder.centerXAnchor.constraint(equalTo: dayImage.centerXAnchor),
            dayboder.widthAnchor.constraint(equalTo: dayImage.widthAnchor),
            dayboder.heightAnchor.constraint(equalToConstant: 1.5)
        ])
        
        tempLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tempLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            tempLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
