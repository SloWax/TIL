//
//  BViewController.swift
//  200427 과제 - 앱 구현
//
//  Created by 표건욱 on 2020/05/03.
//  Copyright © 2020 SloWax. All rights reserved.
//

import UIKit

class BViewController: UIViewController {
    
    let aVC = ViewController()
    let bLable = UILabel()
    let toAButton = UIButton(type: .system)
    var count:Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .darkGray
        
        bLable.frame = CGRect (x: view.center.x-50, y: view.center.y-100, width: 200, height: 50)
        bLable.text = "Lable Count: \(count)"
        bLable.textColor = .lightGray
        view.addSubview(bLable)

        toAButton.frame = CGRect (x: view.center.x-50, y: view.center.y, width: 100, height: 50)
        toAButton.setTitle("To A", for: .normal)
        toAButton.tintColor = .lightGray
        toAButton.addTarget(self, action: #selector(toAToggle(_:)), for: .touchUpInside)
        view.addSubview(toAButton)
    }
    @objc func toAToggle(_ sender:UIButton){
        if let aVC = presentingViewController as? ViewController {
            aVC.count = count + 1
            aVC.aLable.text = "Lable Count: \(aVC.count)"
            dismiss(animated: true)
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
