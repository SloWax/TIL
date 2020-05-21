//
//  ViewController.swift
//  CalculatorExample
//
//  Created by giftbot on 2019/12/19.
//  Copyright © 2019 giftbot. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
    
    @IBOutlet weak var resultLable: UILabel!
    
    var nowValue:Double = 0
    var oldValue:Double = 0
    var result:Double = 0
    
    var sign:Int = 0
    var continuity:Bool = false
    var nonTouchResultClacu:Bool = false
    var calcuCount:Bool = false
    
    let formatter = NumberFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 3
    }
    @IBAction func value(_ button: UIButton) {
        if 15 <= String(nowValue).count {
            return
        }
        if calcuCount, (nowValue != 0), (sign == 0) {
            allClear()
        }
        nowValue == 0 ? (nowValue += Double(button.tag)) : (nowValue = nowValue * 10 + Double(button.tag))
        resultLable.text = formatter.string(from: nowValue as NSNumber)
    }
    @IBAction func operationalSign(_ operationalSign: UIButton) {
        if (oldValue != 0), (nowValue == 0) {
            sign = operationalSign.tag
            return
        }
        if nonTouchResultClacu {
            continuity = true
            Calculate()
            resultLable.text = formatter.string(from: result as NSNumber)
        }
        sign = operationalSign.tag
        continuity ? (oldValue = result) : (oldValue = nowValue)
        nowValue = 0
        nonTouchResultClacu = true
    }
    @IBAction func calcuResult(_ sender: UIButton) {
        if (result == 0), (nowValue == 0) {
            nowValue = oldValue
        }
        Calculate()
        calcuCount = true
        nonTouchResultClacu = false
        resultLable.text = formatter.string(from: result as NSNumber)
    }
    @IBAction func allClearButton(_ sender: UIButton) {
        allClear()
        resultLable.text = formatter.string(from: nowValue as NSNumber)
    }
    func Calculate() {
        switch sign {
        case 10:
            result = (oldValue + nowValue)
        case 11:
            result = (oldValue - nowValue)
        case 12:
            result = (oldValue * nowValue)
        case 13:
            result = (oldValue / nowValue)
        default:
            return
        }
        sign = 0
        continuity = true
    }
    func allClear() {
        nowValue = 0
        oldValue = 0
        result = 0
        sign = 0
        continuity = false
        nonTouchResultClacu = false
        calcuCount = false
    }
}
