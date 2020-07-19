//
//  SecondViewController.swift
//  200512 과제
//
//  Created by 표건욱 on 2020/05/13.
//  Copyright © 2020 SloWax. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    let textLabel = UILabel()
    let disMissButton = UIButton(type: .system)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        textLabel.frame = CGRect(x: view.center.x-50, y: view.center.y-75, width: 100, height: 50)
        textLabel.textColor = .black
        view.addSubview(textLabel)
        
        disMissButton.frame = CGRect(x: view.center.x-50, y: view.center.y, width: 100, height: 50)
        disMissButton.setTitle("DisMiss", for: .normal)
        disMissButton.tintColor = .systemBlue
        disMissButton.layer.cornerRadius = 10
        disMissButton.addTarget(self, action: #selector(disMiss(_:)), for: .touchUpInside)
        view.addSubview(disMissButton)
    }
    @objc func disMiss(_ sender: UIButton){
        dismiss(animated:true)
    }
}
//extension ViewController: UITextFieldDelegate {
//    func textFieldDidEndEditing(_ textField: UITextField) {
//        let secondVC = SecondViewController()
//        secondVC.modalPresentationStyle = .fullScreen
//        present(secondVC, animated: true)
//        secondVC.textLabel.text = textField.text
//        textField.text = nil
//        
//    }
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        textField.resignFirstResponder()
//        return true
//    }
//}
