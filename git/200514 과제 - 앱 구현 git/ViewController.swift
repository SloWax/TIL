//
//  ViewController.swift
//  200514 Login Page
//
//  Created by 표건욱 on 2020/05/14.
//  Copyright © 2020 SloWax. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    let fastCampusLogo = UIImageView()
    let emailLogo = UIImageView()
    let passwordLogo = UIImageView()
    
    let centerBlock = UIView()
    let leftBlock = UIView()
    let rightBlock = UIView()
    
    let containerView = UIView()
    
    let emailTextField = UITextField()
    let passwordTextField = UITextField()
    
    let emailBorder = CALayer()
    let passwordBorder = CALayer()
    
    let signInButton = UIButton(type: .system)
    let joinPresentButton = UIButton(type: .system)
    
    var tempConstraint: NSLayoutConstraint?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "로그인"
        
        view.backgroundColor = .systemBackground
        
        // MARK: -keyboard Notification
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillAppear(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillDisappear(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        
        // MARK: -Top Logo
        fastCampusLogo.image = UIImage(named: "fastcampus_logo")
        view.addSubview(fastCampusLogo)
        
        fastCampusLogo.translatesAutoresizingMaskIntoConstraints = false
        fastCampusLogo.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        fastCampusLogo.heightAnchor.constraint(equalToConstant: 60).isActive = true
        fastCampusLogo.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40).isActive = true
        fastCampusLogo.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -40).isActive = true
        
        
        centerBlock.backgroundColor = .systemPink
        centerBlock.frame = CGRect (x: view.center.x - 10, y: fastCampusLogo.frame.size.height + 170, width: 20, height: 20)
        centerBlock.layer.cornerRadius = 4
        view.addSubview(centerBlock)
        
        
        leftBlock.backgroundColor = .systemPink
        leftBlock.frame = CGRect (x: centerBlock.center.x - 55, y: fastCampusLogo.frame.size.height + 170, width: 20, height: 20)
        leftBlock.layer.cornerRadius = 4
        view.addSubview(leftBlock)
        
        
        rightBlock.backgroundColor = .systemPink
        rightBlock.frame = CGRect (x: centerBlock.center.x + 35, y: fastCampusLogo.frame.size.height + 170, width: 20, height: 20)
        rightBlock.layer.cornerRadius = 4
        view.addSubview(rightBlock)
        
        
        // MARK: -conrainerView
        containerView.backgroundColor = .systemBackground
        view.addSubview(containerView)
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        tempConstraint = containerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 450)
        tempConstraint?.isActive = true
        containerView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        containerView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        containerView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        
        // MARK: -TextField
        emailTextField.placeholder = "이메일을 입력하세요"
        emailTextField.borderStyle = .none
        emailTextField.textColor = .black
        emailTextField.clearButtonMode = .always
        emailTextField.keyboardType = .emailAddress
        emailTextField.returnKeyType = .next
        emailTextField.autocapitalizationType = .none
        emailTextField.layer.cornerRadius = 10
        emailTextField.addTarget(self, action: #selector(textFieldLimit(_:)), for: .editingChanged)
        emailTextField.delegate = self
        containerView.addSubview(emailTextField)
        
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.topAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -270).isActive = true
        emailTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        emailTextField.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 60).isActive = true
        emailTextField.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -30).isActive = true
        
        
        passwordTextField.placeholder = "비밀번호를 입력하세요"
        passwordTextField.borderStyle = .none
        passwordTextField.textColor = .black
        passwordTextField.clearButtonMode = .always
        passwordTextField.keyboardType = .emailAddress
        passwordTextField.returnKeyType = .go
        passwordTextField.autocapitalizationType = .none
        passwordTextField.isSecureTextEntry = true
        passwordTextField.layer.cornerRadius = 10
        passwordTextField.addTarget(self, action: #selector(textFieldLimit(_:)), for: .editingChanged)
        passwordTextField.delegate = self
        containerView.addSubview(passwordTextField)
        
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 50).isActive = true
        passwordTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        passwordTextField.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 60).isActive = true
        passwordTextField.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -30).isActive = true
        
        // MARK: -Button
        signInButton.backgroundColor = .darkGray
        signInButton.setTitle("Sign In", for: .normal)
        signInButton.tintColor = .white
        signInButton.layer.cornerRadius = 10
        signInButton.addTarget(self, action: #selector(siginInPresent(_:)), for: .touchUpInside)
        containerView.addSubview(signInButton)
        
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 40).isActive = true
        signInButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        signInButton.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 20).isActive = true
        signInButton.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -20).isActive = true
        
        
        joinPresentButton.backgroundColor = .darkGray
        joinPresentButton.setTitle("Join", for: .normal)
        joinPresentButton.tintColor = .white
        joinPresentButton.layer.cornerRadius = 10
        joinPresentButton.addTarget(self, action: #selector(joinPresent(_:)), for: .touchUpInside)
        view.addSubview(joinPresentButton)
        
        joinPresentButton.translatesAutoresizingMaskIntoConstraints = false
        joinPresentButton.topAnchor.constraint(equalTo: view.bottomAnchor, constant: -100).isActive = true
        joinPresentButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        joinPresentButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        joinPresentButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        
        
        // MARK: -Logo
        emailLogo.image = UIImage(named: "email")
        containerView.addSubview(emailLogo)
        
        emailLogo.translatesAutoresizingMaskIntoConstraints = false
        emailLogo.topAnchor.constraint(equalTo: emailTextField.topAnchor, constant: 11).isActive = true
        emailLogo.heightAnchor.constraint(equalToConstant: 17).isActive = true
        emailLogo.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 25).isActive = true
        emailLogo.rightAnchor.constraint(equalTo: emailTextField.leftAnchor, constant: -13).isActive = true
        
        
        passwordLogo.image = UIImage(named: "password")
        containerView.addSubview(passwordLogo)
        
        passwordLogo.translatesAutoresizingMaskIntoConstraints = false
        passwordLogo.topAnchor.constraint(equalTo: passwordTextField.topAnchor, constant: 11).isActive = true
        passwordLogo.heightAnchor.constraint(equalToConstant: 20).isActive = true
        passwordLogo.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 25).isActive = true
        passwordLogo.rightAnchor.constraint(equalTo: emailTextField.leftAnchor, constant: -13).isActive = true
    }
    // MARK: -func
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        emailBorder.backgroundColor = UIColor.black.cgColor
        emailBorder.frame = CGRect(x:0, y: emailTextField.frame.size.height + 5, width: emailTextField.frame.width - 1, height: 0.5)
        emailTextField.layer.addSublayer(emailBorder)
        
        
        passwordBorder.backgroundColor = UIColor.black.cgColor
        passwordBorder.frame = CGRect(x:0, y: passwordTextField.frame.size.height + 5, width: passwordTextField.frame.width - 1, height: 0.5)
        passwordTextField.layer.addSublayer(passwordBorder)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @objc func textFieldLimit(_ textField: UITextField) {
        let textCount = textField.text
        if 16 < textCount?.count ?? 0 {
            textField.deleteBackward()
        }
    }
    
    @objc func keyboardWillAppear(_ sender: NotificationCenter) {
        UIView.animate(withDuration: 0.5) {
            self.tempConstraint?.constant = 200
            self.view.layoutIfNeeded()
        }
    }
    
    @objc func keyboardWillDisappear(_ sender: NotificationCenter) {
        UIView.animate(withDuration: 0.5) {
            self.tempConstraint?.constant = 450
            self.view.layoutIfNeeded()
        }
    }
    
    @objc func siginInPresent(_ sender: UIButton) {
        if let userPassword = UserDefaults.standard.value(forKey: emailTextField.text ?? "") as? String, userPassword == passwordTextField.text {
            UserDefaults.standard.set(true, forKey: "Auto Login")
            UserDefaults.standard.set(emailTextField.text, forKey: "Login Data")
            let secondVC = SecondViewController()
            secondVC.modalPresentationStyle = .fullScreen
            present(secondVC, animated: true)
        } else {
            UIView.animate(withDuration: 0.5) {
                self.passwordTextField.backgroundColor = .systemRed
                self.emailTextField.backgroundColor = .systemRed
                self.emailTextField.backgroundColor = .systemBackground
                self.passwordTextField.backgroundColor = .systemBackground
            }
        }
    }
    
    @objc func joinPresent(_ sender: UIButton){
        let thirdVC = thirdViewController()
        navigationController?.pushViewController(thirdVC, animated: true)        
    }
}

