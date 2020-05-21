//
//  thirdViewController.swift
//  200515 과제
//
//  Created by 표건욱 on 2020/05/21.
//  Copyright © 2020 SloWax. All rights reserved.
//

import UIKit

class thirdViewController: UIViewController {
    
    let view1 = UIView()
    let view2 = UIView()
    let view3 = UIView()
    let view4 = UIView()
    let view5 = UIView()
    
    let disMissButton = UIButton(type: .system)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        view1.backgroundColor = .black
        view2.backgroundColor = .black
        view3.backgroundColor = .black
        view4.backgroundColor = .black
        view5.backgroundColor = .black
        view.addSubview(view1)
        view.addSubview(view2)
        view.addSubview(view3)
        view.addSubview(view4)
        view.addSubview(view5)
        
        disMissButton.setTitle("DisMiss", for: .normal)
        disMissButton.addTarget(self, action: #selector(disMiss(_:)), for: .touchUpInside)
        disMissButton.frame.size = CGSize(width: 100, height: 50)
        view.addSubview(disMissButton)
        
        disMissButton.translatesAutoresizingMaskIntoConstraints = false
        disMissButton.topAnchor.constraint(equalTo: view2.bottomAnchor, constant: 50).isActive = true
        disMissButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        
        view1.translatesAutoresizingMaskIntoConstraints = false
        view1.heightAnchor.constraint(equalToConstant: 150).isActive = true
        view1.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60).isActive = true
        view1.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        view1.trailingAnchor.constraint(equalTo: view2.leadingAnchor, constant: -8).isActive = true
        
        view2.translatesAutoresizingMaskIntoConstraints = false
        view2.heightAnchor.constraint(equalToConstant: 150).isActive = true
        view2.widthAnchor.constraint(equalTo: view1.widthAnchor, multiplier: 0.7, constant: -1).isActive = true
        view2.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60).isActive = true
        view2.trailingAnchor.constraint(equalTo: view3.leadingAnchor, constant: -8).isActive = true
        
        view3.translatesAutoresizingMaskIntoConstraints = false
        view3.heightAnchor.constraint(equalToConstant: 150).isActive = true
        view3.widthAnchor.constraint(equalTo: view2.widthAnchor, multiplier: 0.7, constant: -2).isActive = true
        view3.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60).isActive = true
        view3.trailingAnchor.constraint(equalTo: view4.leadingAnchor, constant: -8).isActive = true

        view4.translatesAutoresizingMaskIntoConstraints = false
        view4.heightAnchor.constraint(equalToConstant: 150).isActive = true
        view4.widthAnchor.constraint(equalTo: view3.widthAnchor, multiplier: 0.7, constant: -3).isActive = true
        view4.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60).isActive = true
        view4.trailingAnchor.constraint(equalTo: view5.leadingAnchor, constant: -8).isActive = true

        view5.translatesAutoresizingMaskIntoConstraints = false
        view5.heightAnchor.constraint(equalToConstant: 150).isActive = true
        view5.widthAnchor.constraint(equalTo: view4.widthAnchor, multiplier: 0.7, constant: -4).isActive = true
        view5.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60).isActive = true
        view5.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
    }
    @objc func disMiss(_ sender: UIButton) {
        dismiss(animated: true)
    }

}
