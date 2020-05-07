//
//  ViewController.swift
//  200507 과제
//
//  Created by 표건욱 on 2020/05/07.
//  Copyright © 2020 SloWax. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var countLable: UILabel!
    var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countLable.text = "Count: \(count)"
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        guard let secondVC = segue.destination as? SecondViewController,
            let identifier = segue.identifier
            else { return }
        
        if identifier == "Dog" {
            secondVC.myImage = UIImage(named: "Dog.jpeg")
        } else if identifier == "Cat" {
            secondVC.myImage = UIImage(named: "Cat.jpeg")
        } else if identifier == "Bird"{
            secondVC.myImage = UIImage(named: "Bird.jpeg")
        } else {
            return
        }
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        super.shouldPerformSegue(withIdentifier: identifier, sender: sender)
        if identifier == "Dog", 8 < count{
            return false
        } else if identifier == "Cat", 10 < count{
            return false
        } else if identifier == "Bird", 15 < count{
            return false
        } else {
            return true
        }
    }
    
    
    @IBAction func unwindToViewController(_ unwindSegue: UIStoryboardSegue) {
            }


}

