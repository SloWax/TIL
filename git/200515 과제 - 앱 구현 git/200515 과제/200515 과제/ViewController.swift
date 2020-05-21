//
//  ViewController.swift
//  200515 과제
//
//  Created by 표건욱 on 2020/05/18.
//  Copyright © 2020 SloWax. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let greenView = UIView()
    let yellowView = UIView()
    let blueView = UIView()
    let redView = UIView()
    
    let nextButton = UIButton(type: .system)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        greenView.backgroundColor = .systemGreen
        yellowView.backgroundColor = .systemYellow
        blueView.backgroundColor = .systemBlue
        redView.backgroundColor = .systemRed
        view.addSubview(greenView)
        view.addSubview(yellowView)
        view.addSubview(blueView)
        view.addSubview(redView)
        
        nextButton.setTitle("NEXT", for: .normal)
        nextButton.addTarget(self, action: #selector(present(_:)), for: .touchUpInside)
        yellowView.addSubview(nextButton)
        
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.topAnchor.constraint(equalTo: yellowView.topAnchor, constant: 30).isActive = true
        nextButton.leadingAnchor.constraint(equalTo: yellowView.trailingAnchor, constant: -50).isActive = true
        
        
        greenView.translatesAutoresizingMaskIntoConstraints = false
        greenView.widthAnchor.constraint(equalTo: yellowView.widthAnchor).isActive = true
        greenView.heightAnchor.constraint(equalTo: redView.heightAnchor).isActive = true
        greenView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        greenView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        greenView.trailingAnchor.constraint(equalTo: yellowView.leadingAnchor, constant: 0).isActive = true
        greenView.bottomAnchor.constraint(equalTo: redView.topAnchor, constant: 0).isActive = true
        
        
        yellowView.translatesAutoresizingMaskIntoConstraints = false
        yellowView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        yellowView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        yellowView.bottomAnchor.constraint(equalTo: blueView.topAnchor, constant: 0).isActive = true
        
        
        blueView.translatesAutoresizingMaskIntoConstraints = false
        blueView.widthAnchor.constraint(equalTo: redView.widthAnchor).isActive = true
        blueView.heightAnchor.constraint(equalTo: yellowView.heightAnchor).isActive = true
        blueView.topAnchor.constraint(equalTo: yellowView.bottomAnchor, constant: 0).isActive = true
        blueView.leadingAnchor.constraint(equalTo: redView.trailingAnchor, constant: 0).isActive = true
        blueView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        blueView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
        
        redView.translatesAutoresizingMaskIntoConstraints = false
        redView.topAnchor.constraint(equalTo: greenView.bottomAnchor, constant: 0).isActive = true
        redView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        redView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    }
    @objc func present(_ sender: UIButton) {
        let secondVC = secondViewController()
        secondVC.modalPresentationStyle = .fullScreen
        present(secondVC, animated: true)
    }
}
