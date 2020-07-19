//
//  ProductViewController.swift
//  Dominos11_Starter
//
//  Created by Lee on 2020/05/26.
//  Copyright © 2020 Kira. All rights reserved.
//

import UIKit

class ProductViewController: UIViewController {
    
    let label = UILabel()
    var products = [Product]()
    let tableView = UITableView()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = .systemBackground
    
    tableView.frame = view.frame
    tableView.rowHeight = 120
    tableView.dataSource = self
    tableView.delegate = self
    view.addSubview(tableView)
    
  }
}

extension ProductViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell
        if let reusableCell = tableView.dequeueReusableCell(withIdentifier: "Cell") {
            cell = reusableCell
        } else {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "Cell")
        }
        cell.imageView?.image = UIImage(named: products[indexPath.row].name)
        cell.textLabel?.text = products[indexPath.row].name
        cell.detailTextLabel?.text = "\(products[indexPath.row].price)원"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = DetailViewController()
        detailVC.menuName = products[indexPath.row].name
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
