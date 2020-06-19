//
//  NameWSViewController.swift
//  SlackNewWorkspaceUI
//
//  Copyright © 2020 giftbot. All rights reserved.
//

import UIKit

final class NameWSViewController: UIViewController {
    
    let dismissButton = UIButton(type: .system)
    let nextButton = UIButton(type: .system)
    let nameTextField = UITextField()
    let placeholderLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.backgroundColor = .systemBackground
        
        dismissButton.setImage(UIImage(systemName: "xmark"), for: .normal)
        dismissButton.sizeToFit()
        dismissButton.tintColor = .black
        dismissButton.addTarget(self, action: #selector(dismissToggle(_:)), for: .touchUpInside)
        view.addSubview(dismissButton)
        
        nextButton.setTitle("Next", for: .normal)
        nextButton.sizeToFit()
        nextButton.addTarget(self, action: #selector(nextToggle(_:)), for: .touchUpInside)
        view.addSubview(nextButton)
        
        placeholderLabel.text = "Name your workspace"
        placeholderLabel.sizeToFit()
        placeholderLabel.alpha = 0
        view.addSubview(placeholderLabel)
        
        nameTextField.placeholder = "Name your workspace"
        view.addSubview(nameTextField)
        
        dismissButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            dismissButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            dismissButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20)
        ])
        
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nextButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            nextButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20)
        ])
        
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            nameTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            nameTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10)
        ])
        
        placeholderLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            placeholderLabel.bottomAnchor.constraint(equalTo: nameTextField.bottomAnchor),
            placeholderLabel.leadingAnchor.constraint(equalTo: nameTextField.leadingAnchor)
        ])
    }
    @objc func dismissToggle(_ sender: UIButton) {
        dismiss(animated: true)
    }
    @objc func nextToggle(_ sender: UIButton) {
        let urlVC = UrlWSViewController()
        urlVC.modalPresentationStyle = .fullScreen
        show(urlVC, sender: sender)
    }
}

extension NameWSViewController: UITextFieldDelegate {
    
}
