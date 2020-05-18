//
//  SecondViewController.swift
//  200514 Login Page
//
//  Created by 표건욱 on 2020/05/14.
//  Copyright © 2020 SloWax. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
//    var window: UIWindow?

    let emailLable = UILabel()
    let signOutButton = UIButton(type: .system)
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        
        // MARK: -View
        emailLable.textAlignment = .center
        if let loginData = UserDefaults.standard.value(forKey: "Login Data") as? String { emailLable.text = loginData }
        view.addSubview(emailLable)
        
        emailLable.translatesAutoresizingMaskIntoConstraints = false
        emailLable.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100).isActive = true
        emailLable.heightAnchor.constraint(equalToConstant: 40).isActive = true
        emailLable.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50).isActive = true
        emailLable.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -50).isActive = true
        
        
        signOutButton.frame = CGRect (x: view.center.x - 50, y: view.center.y, width: 100, height: 50)
        signOutButton.setTitle("Sign Out", for: .normal)
        signOutButton.backgroundColor = .darkGray
        signOutButton.tintColor = .white
        signOutButton.layer.cornerRadius = 10
        signOutButton.addTarget(self, action: #selector(signOut(_:)), for: .touchUpInside)
        view.addSubview(signOutButton)

    }
    // MARK: -func
    @objc func signOut(_ sender: UIButton){
        if let navi = presentingViewController as? UINavigationController, let firstVC = navi.viewControllers.first as? ViewController {
            firstVC.emailTextField.text = nil
            firstVC.passwordTextField.text = nil
            dismiss(animated: true)
        } else if UserDefaults.standard.bool(forKey: "Auto Login") {
            if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
                let sceneDelegate = windowScene.delegate as? SceneDelegate
                sceneDelegate?.window?.rootViewController = ViewController()
            }
            
        }
        UserDefaults.standard.set(false, forKey: "Auto Login")
    }
}
