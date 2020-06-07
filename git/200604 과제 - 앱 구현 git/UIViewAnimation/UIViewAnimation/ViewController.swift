//
//  ViewController.swift
//  UIViewAnimation
//
//  Created by 표건욱 on 2020/06/04.
//  Copyright © 2020 SloWax. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let button0 = UIButton(type: .system)
    let label1 = UILabel()
    let label2 = UILabel()
    let label3 = UILabel()
    let label4 = UILabel()
    
    let color : [UIColor] = [.black, .blue, .brown, .cyan, .darkGray, .gray, .lightGray, .systemPink]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        button0.setTitle("버튼 0", for: .normal)
        label1.text = "버튼 1"
        label2.text = "버튼 2"
        label3.text = "버튼 3"
        label4.text = "버튼 4"
        
        button0.layer.cornerRadius = button0.frame.width / 2
        
        button0.backgroundColor = color.randomElement()
        label1.backgroundColor = color.randomElement()
        label2.backgroundColor = color.randomElement()
        label3.backgroundColor = color.randomElement()
        label4.backgroundColor = color.randomElement()
        
        view.addSubview(label1)
        view.addSubview(label2)
        view.addSubview(label3)
        view.addSubview(label4)
        view.addSubview(button0)
        
        button0.translatesAutoresizingMaskIntoConstraints = false
        button0.widthAnchor.constraint(equalToConstant: 50).isActive = true
        button0.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button0.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50).isActive = true
        button0.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50).isActive = true
    }


}

