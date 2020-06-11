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
    
    imageLogo.frame = CGRect(origin: .zero, size: CGSize(width: view.frame.width, height: 200))
    imageLogo.image = UIImage(named: "logo")
    imageLogo.contentMode = .scaleAspectFit
    
    tableView.frame = view.frame
    tableView.rowHeight = 100
    tableView.tableHeaderView = imageLogo
    tableView.dataSource = self
    tableView.delegate = self
    tableView.register(CategoryCell.self, forCellReuseIdentifier: CategoryCell.identifier)
    view.addSubview(tableView)
    
  }
}

extension CategoryViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        category.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CategoryCell.identifier, for: indexPath) as! CategoryCell
        cell.imageCategory.image = UIImage(named: category[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let productVC = ProductViewController()
        productVC.navigationItem.title = menuData[indexPath.row].category
        productVC.products = menuData[indexPath.row].products
        navigationController?.pushViewController(productVC, animated: true)
    }
}
