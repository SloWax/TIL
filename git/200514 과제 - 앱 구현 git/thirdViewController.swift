//
//  thirdViewController.swift
//  200514 Login Page
//
//  Created by 표건욱 on 2020/05/17.
//  Copyright © 2020 SloWax. All rights reserved.
//

import UIKit

class thirdViewController: UIViewController, UITextFieldDelegate {
    
    let fastCampusLogo = UIImageView()
    let emailLogo = UIImageView()
    let passwordLogo = UIImageView()
    let passwordLogo2 = UIImageView()
    
    let centerBlock = UIView()
    let leftBlock = UIView()
    let rightBlock = UIView()
    
    let containerView = UIView()
    
    let joinEmailText = UITextField()
    let joinPasswordText = UITextField()
    let joinPasswordText2 = UITextField()
    
    let emailLimitLable = UILabel()
    let passwordLimitLable = UILabel()
    let passwordLimitLable2 = UILabel()
    
    let emailBorder = CALayer()
    let passwordBorder = CALayer()
    let passwordBorder2 = CALayer()
    
    let joinButton = UIButton(type: .system)
    
    var tempConstraint: NSLayoutConstraint?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        navigationItem.title = "회원가입"
        
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
        
        // MARK: -containerView
        containerView.backgroundColor = .systemBackground
        view.addSubview(containerView)
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        tempConstraint = containerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 380)
        tempConstraint?.isActive = true
        containerView.heightAnchor.constraint(equalToConstant: 270).isActive = true
        containerView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        containerView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        
        // MARK: -TextField
        joinEmailText.placeholder = "가입하실 이메일을 입력하세요"
        joinEmailText.borderStyle = .none
        joinEmailText.textColor = .black
        joinEmailText.clearButtonMode = .always
        joinEmailText.keyboardType = .emailAddress
        joinEmailText.returnKeyType = .next
        joinEmailText.autocapitalizationType = .none
        joinEmailText.layer.cornerRadius = 10
        joinEmailText.addTarget(self, action: #selector(emailTextFieldLimit(_:)), for: .editingChanged)
        joinEmailText.delegate = self
        containerView.addSubview(joinEmailText)

        joinEmailText.translatesAutoresizingMaskIntoConstraints = false
        joinEmailText.topAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -270).isActive = true
        joinEmailText.heightAnchor.constraint(equalToConstant: 40).isActive = true
        joinEmailText.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 60).isActive = true
        joinEmailText.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -30).isActive = true

        
        joinPasswordText.placeholder = "비밀번호를 입력하세요"
        joinPasswordText.borderStyle = .none
        joinPasswordText.textColor = .black
        joinPasswordText.clearButtonMode = .always
        joinPasswordText.keyboardType = .emailAddress
        joinPasswordText.returnKeyType = .next
        joinPasswordText.autocapitalizationType = .none
        joinPasswordText.isSecureTextEntry = true
        joinPasswordText.layer.cornerRadius = 10
        joinPasswordText.addTarget(self, action: #selector(passwordTextFieldLimit(_:)), for: .editingChanged)
        joinPasswordText.delegate = self
        containerView.addSubview(joinPasswordText)

        joinPasswordText.translatesAutoresizingMaskIntoConstraints = false
        joinPasswordText.topAnchor.constraint(equalTo: joinEmailText.bottomAnchor, constant: 50).isActive = true
        joinPasswordText.heightAnchor.constraint(equalToConstant: 40).isActive = true
        joinPasswordText.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 60).isActive = true
        joinPasswordText.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -30).isActive = true
        
        
        joinPasswordText2.placeholder = "비밀번호를 다시 입력하세요"
        joinPasswordText2.borderStyle = .none
        joinPasswordText2.textColor = .black
        joinPasswordText2.clearButtonMode = .always
        joinPasswordText2.keyboardType = .emailAddress
        joinPasswordText2.returnKeyType = .done
        joinPasswordText2.autocapitalizationType = .none
        joinPasswordText2.isSecureTextEntry = true
        joinPasswordText2.layer.cornerRadius = 10
        joinPasswordText2.addTarget(self, action: #selector(passwordTextFieldMatch(_:)), for: .editingChanged)
        joinPasswordText2.delegate = self
        containerView.addSubview(joinPasswordText2)
        
        joinPasswordText2.translatesAutoresizingMaskIntoConstraints = false
        joinPasswordText2.topAnchor.constraint(equalTo: joinPasswordText.bottomAnchor, constant: 50).isActive = true
        joinPasswordText2.heightAnchor.constraint(equalToConstant: 40).isActive = true
        joinPasswordText2.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 60).isActive = true
        joinPasswordText2.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -30).isActive = true
        
        
        // MARK: -TextLable
        emailLimitLable.textColor = .systemPink
        view.addSubview(emailLimitLable)
        
        emailLimitLable.translatesAutoresizingMaskIntoConstraints = false
        emailLimitLable.topAnchor.constraint(equalTo: joinEmailText.bottomAnchor, constant: 21).isActive = true
        emailLimitLable.heightAnchor.constraint(equalToConstant: 15).isActive = true
        emailLimitLable.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 60).isActive = true
        
        
        passwordLimitLable.textColor = .systemPink
        containerView.addSubview(passwordLimitLable)
        
        passwordLimitLable.translatesAutoresizingMaskIntoConstraints = false
        passwordLimitLable.topAnchor.constraint(equalTo: joinPasswordText.bottomAnchor, constant: 21).isActive = true
        passwordLimitLable.heightAnchor.constraint(equalToConstant: 15).isActive = true
        passwordLimitLable.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 60).isActive = true
        

        passwordLimitLable2.textColor = .systemPink
        containerView.addSubview(passwordLimitLable2)
        
        passwordLimitLable2.translatesAutoresizingMaskIntoConstraints = false
        passwordLimitLable2.topAnchor.constraint(equalTo: joinPasswordText2.bottomAnchor, constant: 21).isActive = true
        passwordLimitLable2.heightAnchor.constraint(equalToConstant: 15).isActive = true
        passwordLimitLable2.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 60).isActive = true
        
        
        // MARK: -Logo
        emailLogo.image = UIImage(named: "email")
        containerView.addSubview(emailLogo)
        
        emailLogo.translatesAutoresizingMaskIntoConstraints = false
        emailLogo.topAnchor.constraint(equalTo: joinEmailText.topAnchor, constant: 11).isActive = true
        emailLogo.heightAnchor.constraint(equalToConstant: 17).isActive = true
        emailLogo.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 25).isActive = true
        emailLogo.rightAnchor.constraint(equalTo: joinEmailText.leftAnchor, constant: -13).isActive = true
        
        
        passwordLogo.image = UIImage(named: "password")
        containerView.addSubview(passwordLogo)
        
        passwordLogo.translatesAutoresizingMaskIntoConstraints = false
        passwordLogo.topAnchor.constraint(equalTo: joinPasswordText.topAnchor, constant: 11).isActive = true
        passwordLogo.heightAnchor.constraint(equalToConstant: 20).isActive = true
        passwordLogo.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 25).isActive = true
        passwordLogo.rightAnchor.constraint(equalTo: joinPasswordText.leftAnchor, constant: -13).isActive = true
        
        
        passwordLogo2.image = UIImage(named: "password")
        containerView.addSubview(passwordLogo2)
        
        passwordLogo2.translatesAutoresizingMaskIntoConstraints = false
        passwordLogo2.topAnchor.constraint(equalTo: joinPasswordText2.topAnchor, constant: 11).isActive = true
        passwordLogo2.heightAnchor.constraint(equalToConstant: 20).isActive = true
        passwordLogo2.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 25).isActive = true
        passwordLogo2.rightAnchor.constraint(equalTo: joinPasswordText2.leftAnchor, constant: -13).isActive = true
        

        // MARK: -Button
        joinButton.backgroundColor = .darkGray
        joinButton.setTitle("Join", for: .normal)
        joinButton.tintColor = .white
        joinButton.layer.cornerRadius = 10
        joinButton.addTarget(self, action: #selector(joinToggle(_:)), for: .touchUpInside)
        view.addSubview(joinButton)
        
        joinButton.translatesAutoresizingMaskIntoConstraints = false
        joinButton.topAnchor.constraint(equalTo: view.bottomAnchor, constant: -125).isActive = true
        joinButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        joinButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        joinButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true

        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        emailBorder.backgroundColor = UIColor.black.cgColor
        emailBorder.frame = CGRect(x:0, y: joinEmailText.frame.size.height + 5, width: joinEmailText.frame.width - 1, height: 0.5)
        joinEmailText.layer.addSublayer(emailBorder)
        
        
        passwordBorder.backgroundColor = UIColor.black.cgColor
        passwordBorder.frame = CGRect(x:0, y: joinPasswordText.frame.size.height + 5, width: joinPasswordText.frame.width - 1, height: 0.5)
        joinPasswordText.layer.addSublayer(passwordBorder)
        
        passwordBorder2.backgroundColor = UIColor.black.cgColor
        passwordBorder2.frame = CGRect(x:0, y: joinPasswordText2.frame.size.height + 5, width: joinPasswordText2.frame.width - 1, height: 0.5)
        joinPasswordText2.layer.addSublayer(passwordBorder2)
    }
    // MARK: -func
    func joinAndDisMiss(_ sender: Any) {
        UserDefaults.standard.set(joinPasswordText.text, forKey: joinEmailText.text ?? "")
        navigationController?.popToRootViewController(animated: true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @objc func emailTextFieldLimit(_ textField: UITextField) {
        let textCount = textField.text
        if textCount?.count ?? 0 < 4 || 16 < textCount?.count ?? 0 {
            emailLimitLable.text = "4~16 자로 입력해주세요."
        } else {
            emailLimitLable.text = nil
        }
        if 17 < textCount?.count ?? 0 {
            textField.deleteBackward()
        }
    }
    
    @objc func passwordTextFieldLimit(_ textField: UITextField) {
        let textCount = textField.text
        if textCount?.count ?? 0 < 4 || 16 < textCount?.count ?? 0 {
            passwordLimitLable.text = "4~16 자로 입력해주세요."
        } else {
            passwordLimitLable.text = nil
        }
        if textCount != joinPasswordText2.text {
            passwordLimitLable2.text = "비밀번호가 다릅니다."
        } else {
            passwordLimitLable2.text = nil
        }
        if 17 < textCount?.count ?? 0 {
            textField.deleteBackward()
        }
    }
    
    @objc func passwordTextFieldMatch(_ textField: UITextField) {
        let textMatch = textField.text
        if textMatch != joinPasswordText.text {
            passwordLimitLable2.text = "비밀번호가 다릅니다."
        } else {
            passwordLimitLable2.text = nil
        }
        if 17 < textMatch?.count ?? 0 {
            textField.deleteBackward()
        }
    }
    
    @objc func joinToggle(_ sender: UIButton) {
        let EmailText = joinEmailText.text
        let PassText = joinPasswordText.text
        if 3 < EmailText?.count ?? 0, EmailText?.count ?? 0 < 17, 3 < PassText?.count ?? 0, PassText?.count ?? 0 < 17,
            PassText == joinPasswordText2.text {
            let joinAlert = UIAlertController(title: "확인", message: "가입 하시겠습니까?", preferredStyle: .alert)
            let joinOk = UIAlertAction(title: "예", style: .default, handler: joinAndDisMiss(_:))
            let joinNot = UIAlertAction(title: "아니오", style: .destructive)
            joinAlert.addAction(joinNot)
            joinAlert.addAction(joinOk)
            present(joinAlert, animated: true)
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
            self.tempConstraint?.constant = 380
            self.view.layoutIfNeeded()
        }
    }
}
