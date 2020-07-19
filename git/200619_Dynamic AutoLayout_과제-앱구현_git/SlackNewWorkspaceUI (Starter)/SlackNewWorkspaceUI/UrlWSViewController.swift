//
//  UrlWSViewController.swift
//  SlackNewWorkspaceUI
//
//  Copyright © 2020 giftbot. All rights reserved.
//

import UIKit
import AudioToolbox.AudioServices

final class UrlWSViewController: UIViewController {
    
    let dismissButton = UIButton(type: .system)
    let nextButton = UIButton(type: .system)
    let nameTextField = UITextField()
    let placeholderLabel = UILabel()
    let exLabel = UILabel()
    let errorLable = UILabel()
    let slackLable = UILabel()
    
    var slackLableConstraint: NSLayoutConstraint?
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        nameTextField.becomeFirstResponder()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        dismissButton.setImage(UIImage(systemName: "arrow.left"), for: .normal)
        dismissButton.sizeToFit()
        dismissButton.tintColor = .none
        dismissButton.addTarget(self, action: #selector(dismissToggle(_:)), for: .touchUpInside)
        view.addSubview(dismissButton)
        
        nextButton.setTitle("Next", for: .normal)
        nextButton.sizeToFit()
        nextButton.addTarget(self, action: #selector(nextToggle(_:)), for: .touchUpInside)
        view.addSubview(nextButton)
        
        nameTextField.enablesReturnKeyAutomatically = true
        nameTextField.returnKeyType = .go
        nameTextField.autocorrectionType = .no
        nameTextField.autocapitalizationType = .none
        nameTextField.delegate = self
        nameTextField.addTarget(self, action: #selector(buttonIsEnabled(_:)), for: .editingChanged)
        view.addSubview(nameTextField)
        
        slackLable.text = ".slack.com"
        slackLable.textColor = UIColor.darkText.withAlphaComponent(0.5)
        slackLable.font = UIFont.systemFont(ofSize: 23, weight: .thin)
        nameTextField.addSubview(slackLable)
        
        placeholderLabel.text = "Get a URL (Letters, numbers, and dashes only)"
        placeholderLabel.sizeToFit()
        placeholderLabel.font = UIFont.boldSystemFont(ofSize: 13)
        view.addSubview(placeholderLabel)
        
        exLabel.text = "This is the address that you'll use to sign in to Slack"
        exLabel.sizeToFit()
        exLabel.tintColor = .gray
        exLabel.font = exLabel.font.withSize(14)
        exLabel.alpha = 0.5
        view.addSubview(exLabel)
        
        errorLable.text = "This URL is not available. Sorry!"
        errorLable.sizeToFit()
        errorLable.alpha = 0
        errorLable.font = errorLable.font.withSize(14)
        view.addSubview(errorLable)
        
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
        
        slackLable.translatesAutoresizingMaskIntoConstraints = false
        slackLable.centerYAnchor.constraint(equalTo: nameTextField.centerYAnchor).isActive = true
        
        let textSize = (nameTextField.text! as NSString).size(withAttributes: [.font: nameTextField.font!])
        slackLableConstraint = slackLable.leadingAnchor.constraint(equalTo: nameTextField.leadingAnchor, constant: textSize.width)
        slackLableConstraint?.isActive = true
        
        placeholderLabel.translatesAutoresizingMaskIntoConstraints = false
        placeholderLabel.bottomAnchor.constraint(equalTo: nameTextField.topAnchor).isActive = true
        placeholderLabel.leadingAnchor.constraint(equalTo: nameTextField.leadingAnchor).isActive = true
        
        errorLable.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            errorLable.topAnchor.constraint(equalTo: nameTextField.bottomAnchor),
            errorLable.leadingAnchor.constraint(equalTo: nameTextField.leadingAnchor)
        ])
        
        exLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            exLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            exLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10)
        ])
    }
    
    @objc func dismissToggle(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func nextToggle(_ sender: UIButton) {
        goToggle()
    }
    func goToggle() {
        if (nameTextField.text == "error") || (nameTextField.text == "fail") {
            AudioServicesPlayAlertSoundWithCompletion(kSystemSoundID_Vibrate) {
                print("진동 발생")
            }
            errorLable.alpha = 0.4
            UIView.animateKeyframes(withDuration: 0.25, delay: 0, animations: {
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.2, animations: {
                    self.nameTextField.center.x -= 8
                })
                UIView.addKeyframe(withRelativeStartTime: 0.2, relativeDuration: 0.3, animations: {
                    self.nameTextField.center.x += 16
                })
                UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.3, animations: {
                    self.nameTextField.center.x -= 16
                })
                UIView.addKeyframe(withRelativeStartTime: 0.8, relativeDuration: 0.2, animations: {
                    self.nameTextField.center.x += 8
                })
            })
        } else {
            print("OK")
        }
    }
}

extension UrlWSViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let textCount = textField.text?.count
        if textCount == 0 {
            AudioServicesPlayAlertSoundWithCompletion(kSystemSoundID_Vibrate) {
                print("진동 발생")
            }
            let impactFeedbackGenerator = UIImpactFeedbackGenerator(style: .heavy)  // 원하는 스타일로 변경
            impactFeedbackGenerator.prepare()   // 진동 준비
            impactFeedbackGenerator.impactOccurred()   // 진동
            return false
        } else {
            goToggle()
            return true
        }
    }
    @objc func buttonIsEnabled(_ textField: UITextField) {
        errorLable.alpha = 0
        let textFieldAttr = [NSAttributedString.Key.font: textField.font!]
        let textWidthSize = (textField.text! as NSString).size(withAttributes: textFieldAttr).width
        slackLableConstraint?.constant = textWidthSize
        let textCount = textField.text?.count
        textCount == 0 ? (nextButton.isEnabled = false) : (nextButton.isEnabled = true)
        if 20 < textCount ?? 0 {
            textField.deleteBackward()
        }
    }
}
