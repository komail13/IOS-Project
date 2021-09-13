//
//  divisionviewcontroler.swift
//  رياضيات للاطفال
//
//  Created by Komail Alali on 02/07/2020.
//  Copyright © 2020 Komail Alali. All rights reserved.
//

import UIKit

class DivisionViewControler : UIViewController {
    
    var checkCount = 0
    
    @IBOutlet var num1 : UILabel!
    @IBOutlet var num2 : UILabel!
    @IBOutlet var pointsdisplay : UILabel!
    @IBOutlet var message : UILabel!
    @IBOutlet var ans : UITextField!
    
    @IBAction func NewQ() {
        divisiblepair()
        checkCount = 0
        ans.text = ""
    }
    
    @IBAction func checkAns() {
                
        let correctAns = Double(Int(num1.text!)! / Int(num2.text!)!)

        if Double(ans.text!) == correctAns {
            
            checkCount += 1
            message.text = "الجواب صحيح"
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                self.message.text = ""
            }
            if checkCount == 1 {
                points.value += 3
                refresh()
            }
            else {
                points.value += 1
                refresh()
            }
            NewQ()
        }
        else {
            ans.text = ""
            checkCount += 1
            message.text = "الجواب غير صحيح"
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                self.message.text = ""
            }
            points.value -= 1
            refresh()
        }
    
    }
    
    func refresh() {
        pointsdisplay.text = String(points.value)
    }
    
    func divisiblepair() {
        
        repeat {
            num1.text = String(arc4random_uniform(13))
            num2.text = String(arc4random_uniform(12) + 1)
        }while Int(num1.text!)! % Int(num2.text!)! != 0
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NewQ()
        pointsdisplay.text = ""
        message.text = ""
        refresh()
    }
}
