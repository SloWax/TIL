//
//  ViewController.swift
//  ShoppingItems
//
//  Created by giftbot on 2020. 05. 26..
//  Copyright © 2020년 giftbot. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
    
    var items = [("IphoneX Gold", "iPhoneX_White", 5, 0),
                 ("IPhoneX RoseGold", "iPhoneX_White", 4, 0),
                 ("IPhoneX White", "iPhoneX_White", 7, 0),
                 ("IPhoneX SpaceGray", "iPhoneX_SpaceGray", 8, 0),
                 ("IPhone 8 Red", "iPhone8", 3, 0),
                 ("IPhone 8 SpaceGray", "iPhone8", 5, 0),
                 ("IPhone 8 White", "iPhone8", 6, 0),
                 ("IPhone 8 RoseGold", "iPhone8", 2, 0),
                 ("IPhone SE Gold", "iPhoneSE_Gold", 8, 0),
                 ("IPhone SE RoseGold", "iPhoneSE_RoseGold", 6, 0),
                 ("IPhone SE SpaceGray", "iPhoneSE_Gold", 4, 0)
    ]
    
    @IBOutlet private weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.allowsSelection = false
        tableView.rowHeight = 80
        
    }
}

// MARK: - UITableViewDataSource

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ItemCell.identifier, for: indexPath) as! ItemCell
        cell.textLabel?.text = items[indexPath.row].0
        cell.imageView?.image = UIImage(named: items[indexPath.row].1)
        cell.countLabel?.text = "\(items[indexPath.row].3)"
        cell.countAdd.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
        
        return cell
    }
    @objc private func didTapButton(_ sender: UIButton) {
        let alert = UIAlertController(title: "재고부족", message: "더 이상 주문 할 수 없습니다.", preferredStyle: .alert)
        let okButton = UIAlertAction(title: "확인", style: .cancel)
        alert.addAction(okButton)
        if let cell = sender.superview?.superview as? ItemCell,
            let row = tableView.indexPath(for: cell)?.row {
            guard items[row].2 != items[row].3 else {
                cell.backgroundColor = UIColor.red.withAlphaComponent(0.7)
                UIView.animate(withDuration: 0.8, animations: {
                    cell.backgroundColor = .white
                })
                present(alert, animated: true)
                return
            }
            let addedNumber = items[row].3 + 1
            items[row].3 = addedNumber
            
            cell.countLabel?.text = "\(items[row].3)"
        }
    }
}

