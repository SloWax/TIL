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
        let navi = UINavigationController(rootViewController: nameVC)
        navi.modalPresentationStyle = .fullScreen
        navi.navigationBar.isHidden = true
        present(navi, animated: true)
    }
}
