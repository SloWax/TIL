//
//  ViewController.swift
//  SlackNewWorkspaceUI
//
//  Copyright © 2020 giftbot. All rights reserved.
//

import UIKit

final class CreateNewWSViewController: UIViewController {
    
    let button = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        button.setTitle("Create New Workspace", for: .normal)
        button.sizeToFit()
        button.center = view.center
        button.addTarget(self, action: #selector(presentToggle(_:)), for: .touchUpInside)
        view.addSubview(button)
    }
    @objc func presentToggle(_ sender: UIButton) {
        let nameVC = NameWSViewController()
        nameVC.modalPresentationStyle = .fullScreen
        present(nameVC, animated: true)
    }
}
