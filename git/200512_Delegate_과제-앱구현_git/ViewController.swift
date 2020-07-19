//
//  ViewController.swift
//  200512 과제
//
//  Created by 표건욱 on 2020/05/13.
//  Copyright © 2020 SloWax. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let textField = UITextField()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.frame = CGRect (x: view.center.x-100, y: view.center.y-100, width: 200, height: 50)
        textField.borderStyle = .roundedRect
        textField.clearButtonMode = .whileEditing
        textField.delegate = self
        view.addSubview(textField)
        
    }
}
extension ViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        let secondVC = SecondViewController()
        secondVC.modalPresentationStyle = .fullScreen
        present(secondVC, animated: true)
        secondVC.textLabel.text = textField.text
        textField.text = nil
        
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
