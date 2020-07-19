//
//  ViewController.swift
//  200507 과제
//
//  Created by 표건욱 on 2020/05/07.
//  Copyright © 2020 SloWax. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var dogLable: UILabel!
    @IBOutlet weak var catLable: UILabel!
    @IBOutlet weak var birdLable: UILabel!
    var dogCount = 0
    var catCount = 0
    var birdCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dogLable.text = "Count: \(dogCount)"
        catLable.text = "Count: \(catCount)"
        birdLable.text = "Count: \(birdCount)"
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        guard let secondVC = segue.destination as? SecondViewController,
            let identifier = segue.identifier
            else { return }
        
        if identifier == "Dog" {
            dogCount += 1
            dogLable.text = "Count: \(dogCount)"
            secondVC.myImage = UIImage(named: "Dog.jpeg")
        } else if identifier == "Cat" {
            catCount += 1
            catLable.text = "Count: \(catCount)"
            secondVC.myImage = UIImage(named: "Cat.jpeg")
        } else if identifier == "Bird"{
            birdCount += 1
            birdLable.text = "Count: \(birdCount)"
            secondVC.myImage = UIImage(named: "Bird.jpeg")
        } else {
            return
        }
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        super.shouldPerformSegue(withIdentifier: identifier, sender: sender)
        if identifier == "Dog", 8 < dogCount{
            return false
        } else if identifier == "Cat", 10 < catCount{
            return false
        } else if identifier == "Bird", 15 < birdCount{
            return false
        } else {
            return true
        }
    }
    
    
    @IBAction func unwindToViewController(_ unwindSegue: UIStoryboardSegue) {
            }


}

