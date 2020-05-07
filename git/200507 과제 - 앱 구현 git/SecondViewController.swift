//
//  SecondViewController.swift
//  200507 과제
//
//  Created by 표건욱 on 2020/05/07.
//  Copyright © 2020 SloWax. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    var myImage: UIImage?
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var addCount: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = myImage
        
    }
    @IBAction func addcount(_sender: UIButton){
        if let firstVC = presentingViewController as? ViewController {
            firstVC.count += 1
            firstVC.countLable.text = "Count: \(firstVC.count)"
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
