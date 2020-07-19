//
//  WishListViewController.swift
//  Dominos11_Starter
//
//  Created by Lee on 2020/05/26.
//  Copyright © 2020 Kira. All rights reserved.
//

import UIKit

class WishListViewController: UIViewController {

    let singleton = Singleton.shared
    let tableView = UITableView()

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        tableView.reloadData()
    }

  override func viewDidLoad() {
    super.viewDidLoad()

    navigationItem.title = "Wish List"

    let listClearButton = UIBarButtonItem(title: "목록 지우기", style: .plain, target: self, action: #selector(listClearToggle(_:)))
    let oderButton = UIBarButtonItem(title: "주문", style: .plain, target: self, action: #selector(oderToggle(_:)))

    navigationItem.leftBarButtonItem = listClearButton
    navigationItem.rightBarButtonItem = oderButton

    tableView.frame = view.safeAreaLayoutGuide.layoutFrame
    tableView.dataSource = self
    tableView.rowHeight = 100
    tableView.allowsSelection = false
    view.addSubview(tableView)

  }

    @objc func listClearToggle(_ sender: Any) {
        singleton.wishList.removeAll()
        tableView.reloadData()
    }

    @objc func oderToggle(_ sender: UIButton) {
        let keys = singleton.wishList.keys.sorted()
        var paymentList = ""
        var paymentValue = 0
        for key in keys {
            for category in menuData {
                for menu in category.products {
                    if key == menu.name {
                        paymentList += "\(key) - \(singleton.wishList[key] ?? 0) 개\n"
                        paymentValue += (singleton.wishList[key]! * menu.price)
                    }
                }
            }
        }
        paymentList += "결제금액 : \(paymentValue)원"
        alertAction(title: "결제내역", message: paymentList)
    }
    
    func alertAction(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "결제하기", style: .default, handler: listClearToggle(_:))
        let cancleButton = UIAlertAction(title: "취소", style: .cancel)
        alert.addAction(okButton)
        alert.addAction(cancleButton)
        present(alert, animated: true)
    }
}
extension WishListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return singleton.wishList.keys.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let keys = Singleton.shared.wishList.keys.sorted()
        let cell: UITableViewCell
        if let reusableCell = tableView.dequeueReusableCell(withIdentifier: "cell") {
            cell = reusableCell
        } else {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        }
        cell.imageView?.image = UIImage(named: "\(keys[indexPath.row])")
        cell.textLabel?.text = keys[indexPath.row]
        cell.detailTextLabel?.text = "주문수량: \(singleton.wishList[keys[indexPath.row]] ?? 0) 개"
        return cell
    }
}

