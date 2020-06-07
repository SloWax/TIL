//
//  WishListViewController.swift
//  Dominos11_Starter
//
//  Created by Lee on 2020/05/26.
//  Copyright © 2020 Kira. All rights reserved.
//

import UIKit

class WishListViewController: UIViewController {
    
    let label = UILabel()
    let tableView = UITableView()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    navigationItem.title = "Wish List"
    
    let listClearButton = UIBarButtonItem(title: "목록 지우기", style: .plain, target: self, action: #selector(listClearToggle(_:)))
    let oderButton = UIBarButtonItem(title: "주문", style: .plain, target: self, action: #selector(oderToggle(_:)))
    
    navigationItem.leftBarButtonItem = listClearButton
    navigationItem.rightBarButtonItem = oderButton
    
    tableView.frame = view.frame
    
  }
    @objc func listClearToggle(_ sender: UIButton) {
        
    }
    @objc func oderToggle(_ sender: UIButton) {
        
    }
}
