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
    
    var label1Temp: NSLayoutConstraint?
    var label2Temp: NSLayoutConstraint?
    var label3Temp: NSLayoutConstraint?
    var label4Temp: NSLayoutConstraint?
    
    let color : [UIColor] = [.blue, .brown, .cyan, .darkGray, .gray, .lightGray, .systemPink, .green]
    
    let button1 = UIButton(type: .system)
    let button2 = UIButton(type: .system)
    let button3 = UIButton(type: .system)
    let button4 = UIButton(type: .system)
    let button5 = UIButton(type: .system)
    
    var button2Temp: NSLayoutConstraint?
    var button3Temp: NSLayoutConstraint?
    var button4Temp: NSLayoutConstraint?
    var button5Temp: NSLayoutConstraint?
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let buttonArr1 = [button0, label1, label2, label3, label4]
        let buttonArr2 = [button1, button2, button3, button4, button5]
        
        buttonArr1.forEach {
            $0.layer.cornerRadius = $0.frame.width / 2
            $0.clipsToBounds = true
        }
        
        buttonArr2.forEach {
            $0.layer.cornerRadius = $0.frame.width / 2
            $0.clipsToBounds = true
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let buttonArr1 = [label1, label2, label3, label4, button0]
        let buttonArr2 = [button5, button4, button3, button2, button1]
        
        button0.setTitle("버튼 0", for: .normal)
        button0.addTarget(self, action: #selector(buttonToggle(_:)), for: .touchUpInside)
        label1.text = "버튼 1"
        label2.text = "버튼 2"
        label3.text = "버튼 3"
        label4.text = "버튼 4"
        
        
        buttonArr1.forEach{
            $0.backgroundColor = color.randomElement()
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.widthAnchor.constraint(equalToConstant: 50).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 50).isActive = true
        }
        
        button0.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50).isActive = true
        button0.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50).isActive = true
        
        label1.leadingAnchor.constraint(equalTo: button0.leadingAnchor, constant: 0).isActive = true
        label1Temp = label1.bottomAnchor.constraint(equalTo: button0.bottomAnchor, constant: 0)
        label1Temp?.isActive = true
        
        label2.leadingAnchor.constraint(equalTo: label1.leadingAnchor, constant: 0).isActive = true
        label2Temp = label2.bottomAnchor.constraint(equalTo: label1.bottomAnchor, constant: 0)
        label2Temp?.isActive = true
        
        label3.leadingAnchor.constraint(equalTo: label2.leadingAnchor, constant: 0).isActive = true
        label3Temp = label3.bottomAnchor.constraint(equalTo: label2.bottomAnchor, constant: 0)
        label3Temp?.isActive = true
        
        label4.leadingAnchor.constraint(equalTo: label3.leadingAnchor, constant: 0).isActive = true
        label4Temp = label4.bottomAnchor.constraint(equalTo: label3.bottomAnchor, constant: 0)
        label4Temp?.isActive = true
        
        button1.addTarget(self, action: #selector(buttonToggle2(_:)), for: .touchUpInside)
        button1.setTitle("버튼 1", for: .normal)
        button2.setTitle("버튼 2", for: .normal)
        button3.setTitle("버튼 3", for: .normal)
        button4.setTitle("버튼 4", for: .normal)
        button5.setTitle("버튼 5", for: .normal)
        
        buttonArr2.forEach{
            $0.backgroundColor = color.randomElement()
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.widthAnchor.constraint(equalToConstant: 50).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 50).isActive = true
        }
        
        button1.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50).isActive = true
        button1.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50).isActive = true
        
        button2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50).isActive = true
        button2Temp = button2.bottomAnchor.constraint(equalTo: button1.bottomAnchor, constant: 0)
        button2Temp?.isActive = true
        
        button3.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50).isActive = true
        button3Temp = button3.bottomAnchor.constraint(equalTo: button2.bottomAnchor, constant: 0)
        button3Temp?.isActive = true
        
        button4.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50).isActive = true
        button4Temp = button4.bottomAnchor.constraint(equalTo: button3.bottomAnchor, constant: 0)
        button4Temp?.isActive = true
        
        button5.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50).isActive = true
        button5Temp = button5.bottomAnchor.constraint(equalTo: button4.bottomAnchor, constant: 0)
        button5Temp?.isActive = true
    }
    
    @objc func buttonToggle(_ sender: UIButton) {
        let tempArr = [label1Temp, label2Temp, label3Temp, label4Temp]
        sender.isSelected.toggle()
        
        if sender.isSelected {
            UIView.animate(withDuration: 0.5) {
                tempArr.forEach { $0?.constant = -100}
                self.view.layoutIfNeeded()
            }
        } else {
                UIView.animate(withDuration: 0.5) {
                    tempArr.forEach { $0?.constant = 0}
                    self.view.layoutIfNeeded()
                }
            }
        }
    
    @objc func buttonToggle2(_ sender: UIButton) {
        let tempArr2 = [button2Temp, button3Temp, button4Temp, button5Temp]
        sender.isSelected.toggle()
        
        if sender.isSelected {
            UIView.animateKeyframes(withDuration: 0.5,
                                    delay: 0,
                                    options: [.beginFromCurrentState],
                                    animations: {
                UIView.addKeyframe(withRelativeStartTime: 0,
                                   relativeDuration: 0.25) {
                                    self.button2Temp?.constant = -100
                                    self.view.layoutIfNeeded()
                }
                UIView.addKeyframe(withRelativeStartTime: 0.25,
                                   relativeDuration: 0.25) {
                                    self.button3Temp?.constant = -100
                                    self.view.layoutIfNeeded()
                }
                UIView.addKeyframe(withRelativeStartTime: 0.5,
                                   relativeDuration: 0.25) {
                                    self.button4Temp?.constant = -100
                                    self.view.layoutIfNeeded()
                }
                UIView.addKeyframe(withRelativeStartTime: 0.75,
                                   relativeDuration: 0.25) {
                                    self.button5Temp?.constant = -100
                                    self.view.layoutIfNeeded()
                }
            })
        } else {
            UIView.animateKeyframes(withDuration: 0.5,
                                    delay: 0,
                                    options: [.beginFromCurrentState],
                                    animations: {
                UIView.addKeyframe(withRelativeStartTime: 0,
                                   relativeDuration: 0.25) {
                                    self.button5Temp?.constant = 0
                                    self.view.layoutIfNeeded()
                }
                UIView.addKeyframe(withRelativeStartTime: 0.25,
                                   relativeDuration: 0.25) {
                                    self.button4Temp?.constant = 0
                                    self.view.layoutIfNeeded()
                }
                UIView.addKeyframe(withRelativeStartTime: 0.5,
                                   relativeDuration: 0.25) {
                                    self.button3Temp?.constant = 0
                                    self.view.layoutIfNeeded()
                }
                UIView.addKeyframe(withRelativeStartTime: 0.75,
                                   relativeDuration: 0.25) {
                                    self.button2Temp?.constant = 0
                                    self.view.layoutIfNeeded()
                }
            })
        }
    }
}



