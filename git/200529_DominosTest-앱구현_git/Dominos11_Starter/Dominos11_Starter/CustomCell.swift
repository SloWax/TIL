//
//  CustomCellTableViewCell.swift
//  Dominos11_Starter
//
//  Created by 표건욱 on 2020/05/29.
//  Copyright © 2020 Kira. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {
    
    let cellImage = UIImage()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(cellImage)
    }


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
