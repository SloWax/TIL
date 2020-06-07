//
//  CategoryViewController.swift
//  Dominos11_Starter
//
//  Created by Lee on 2020/05/26.
//  Copyright © 2020 Kira. All rights reserved.
//

import UIKit

class CategoryViewController: UIViewController {
    
    let imageLogo = UIImageView()
    let category: [String] = ["슈퍼시드","프리미엄", "클래식", "사이드디시", "음료", "피클소스"]
    let tableView = UITableView()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    navigationItem.title = "Domino's"
    
    imageLogo.image = UIImage(named: "logo")
    imageLogo.frame = CGRect(x: 0, y: 0, width: tableView.frame.width, height: tableView.frame.height/3)
    
    tableView.frame = view.frame
    tableView.rowHeight = 100
    tableView.tableHeaderView = imageLogo
    tableView.dataSource = self
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CellID")
    view.addSubview(tableView)
    
    
//    imageView.image = UIImage(named: "logo")
//    tableView.addSubview(imageView)
    
  }
}

extension CategoryViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        category.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellID", for: indexPath)
        cell.imageView?.image = UIImage(named: category[indexPath.row])
        
        return cell
    }
}
