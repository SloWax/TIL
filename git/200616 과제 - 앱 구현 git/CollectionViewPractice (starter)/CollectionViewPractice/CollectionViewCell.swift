//
//  CollectionViewCell.swift
//  CollectionViewPractice
//
//  Created by 표건욱 on 2020/07/14.
//  Copyright © 2020 Giftbot. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    let imageView = UIImageView()
    let checkImage = UIImageView()
    
    static let identifier = "Cell"
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        imageView.frame = contentView.bounds
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layer.cornerRadius = 15
        clipsToBounds = true
        
        imageView.frame = contentView.bounds
        imageView.contentMode = .scaleAspectFill
        contentView.addSubview(imageView)
        
        checkImage.image = UIImage(systemName: "checkmark.circle.fill")
        checkImage.tintColor = .white
        checkImage.sizeToFit()
        checkImage.isHidden = true
        contentView.addSubview(checkImage)
        
        checkImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            checkImage.bottomAnchor.constraint(equalTo: imageView.bottomAnchor, constant: -5),
            checkImage.trailingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: -5)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
