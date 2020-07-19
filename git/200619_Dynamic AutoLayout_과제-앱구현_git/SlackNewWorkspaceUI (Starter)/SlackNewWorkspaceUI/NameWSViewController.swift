//
//  NameWSViewController.swift
//  SlackNewWorkspaceUI
//
//  Copyright © 2020 giftbot. All rights reserved.
//

import UIKit
import AudioToolbox.AudioServices

final class NameWSViewController: UIViewController {
    
    let dismissButton = UIButton(type: .system)
    let nextButton = UIButton(type: .system)
    let nameTextField = UITextField()
    let placeholderLabel = UILabel()
    let indicatorView: UIActivityIndicatorView = {
        let indicatorView = UIActivityIndicatorView(style: .medium)
        indicatorView.hidesWhenStopped = true
        return indicatorView
    }()
    
    var placeholderConstraint: NSLayoutConstraint?
    var indicatorConstraint: NSLayoutConstraint?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        nameTextField.becomeFirstResponder()
    }
    
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
        nextButton.isEnabled = false
        nextButton.addTarget(self, action: #selector(nextToggle(_:)), for: .touchUpInside)
        view.addSubview(nextButton)
        
        placeholderLabel.text = "Name your workspace"
        placeholderLabel.sizeToFit()
        placeholderLabel.font = UIFont.boldSystemFont(ofSize: 13)
        placeholderLabel.alpha = 0
        view.addSubview(placeholderLabel)
        
        nameTextField.placeholder = "Name your workspace"
        nameTextField.enablesReturnKeyAutomatically = true
        nameTextField.returnKeyType = .go
        nameTextField.autocorrectionType = .no
        nameTextField.autocapitalizationType = .none
        nameTextField.delegate = self
        nameTextField.addTarget(self, action: #selector(buttonIsEnabled(_:)), for: .editingChanged)
        view.addSubview(nameTextField)
        nameTextField.addSubview(indicatorView)
        
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
            nameTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -140),
            nameTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            nameTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10)
        ])
        
        placeholderLabel.translatesAutoresizingMaskIntoConstraints = false
        placeholderConstraint = placeholderLabel.bottomAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 0)
        placeholderConstraint?.isActive = true
        placeholderLabel.leadingAnchor.constraint(equalTo: nameTextField.leadingAnchor).isActive = true
        
        indicatorView.translatesAutoresizingMaskIntoConstraints = false
        indicatorView.centerYAnchor.constraint(equalTo: nameTextField.centerYAnchor).isActive = true
        indicatorConstraint = indicatorView.leadingAnchor.constraint(equalTo: nameTextField.leadingAnchor)
        indicatorConstraint?.isActive = true
    }
    
    @objc func dismissToggle(_ sender: UIButton) {
        dismiss(animated: true)
    }
    @objc func nextToggle(_ sender: UIButton) {
        naviPush()
    }
    func naviPush() {
        let text = nameTextField.text
        let textSize = (text! as NSString).size(withAttributes: [.font: nameTextField.font!])
        indicatorConstraint?.constant = textSize.width + 8
        indicatorView.startAnimating()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.indicatorView.stopAnimating()
            let urlVC = UrlWSViewController()
            urlVC.nameTextField.text = self.nameTextField.text
            self.navigationController?.pushViewController(urlVC, animated: true)
        }
    }
}

extension NameWSViewController: UITextFieldDelegate {
    @objc func buttonIsEnabled(_ textField: UITextField) {
        let textCount = textField.text?.count
        if textCount == 0 {
            nextButton.isEnabled = false
            UIView.animate(withDuration: 0.3, animations: {
                self.placeholderLabel.alpha = 0
                self.placeholderConstraint?.constant = 0
                self.view.layoutIfNeeded()
            })
        } else {
            nextButton.isEnabled = true
            UIView.animate(withDuration: 0.3, animations: {
                self.placeholderLabel.alpha = 1
                self.placeholderConstraint?.constant = -30
                self.view.layoutIfNeeded()
            })
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let textCount = textField.text?.count
        if textCount == 0 {
            AudioServicesPlayAlertSoundWithCompletion(kSystemSoundID_Vibrate) {
                print("진동 발생")
            }
            let impactFeedbackGenerator = UIImpactFeedbackGenerator(style: .heavy)  // 원하는 스타일로 변경
            impactFeedbackGenerator.prepare()   // 진동 준비
            impactFeedbackGenerator.impactOccurred()   // 진동
            return true
        } else {
            naviPush()
            return false
        }
    }
}
