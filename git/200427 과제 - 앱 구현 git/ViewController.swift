//
//  ViewController.swift
//  200427 과제 - 앱 구현
//
//  Created by 표건욱 on 2020/05/03.
//  Copyright © 2020 SloWax. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let aLable = UILabel()
    let toBButton = UIButton(type: .system)
    var count: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .darkGray
        
        aLable.frame = CGRect (x: view.center.x-50, y: view.center.y-100, width: 200, height: 50)
        aLable.text = "Lable Count: \(count)"
        aLable.textColor = .lightGray
        view.addSubview(aLable)
        
        toBButton.frame = CGRect(x: view.center.x-50, y: view.center.y, width: 100, height: 50)
        toBButton.setTitle("To B", for: .normal)
        toBButton.tintColor = .lightGray
        toBButton.addTarget(self, action: #selector(toBToggle(_:)), for: .touchUpInside)
        view.addSubview(toBButton)
    }
    @objc func toBToggle(_ sender: UIButton){
        let bVC = BViewController()
        bVC.count = count + 3
        bVC.bLable.text = "Lable Count: \(bVC.count)"
        bVC.modalPresentationStyle = .formSheet
        present(bVC, animated: true)
    }
}

