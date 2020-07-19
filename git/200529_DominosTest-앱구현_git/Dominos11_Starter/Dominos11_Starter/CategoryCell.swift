//
//  CategoryCell.swift
//  Dominos11_Starter
//
//  Created by 표건욱 on 2020/06/11.
//  Copyright © 2020 Kira. All rights reserved.
//

import UIKit

class CategoryCell: UITableViewCell {
    
    let imageCategory = UIImageView()
    static let identifier = "CategoryTableViewCell"

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        imageCategory.contentMode = .scaleToFill
        contentView.addSubview(imageCategory)
        
        imageCategory.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        imageCategory.topAnchor.constraint(equalTo: contentView.topAnchor),
        imageCategory.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
        imageCategory.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        imageCategory.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
