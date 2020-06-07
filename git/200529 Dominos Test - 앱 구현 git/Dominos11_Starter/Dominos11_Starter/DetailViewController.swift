//
//  DetailViewController.swift
//  Dominos11_Starter
//
//  Created by Lee on 2020/05/26.
//  Copyright © 2020 Kira. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    let label = UILabel()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    label.frame = CGRect(x: view.center.x, y: view.center.y, width: 100, height: 100)
    label.text = "detail"
    label.tintColor = .black
    view.addSubview(label)
    
  }
}
