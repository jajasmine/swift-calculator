//
//  ViewController.swift
//  calculator
//
//  Created by soslab on 2016/3/15.
//  Copyright © 2016年 soslab. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var screen: UILabel!
    var firstNumber = Float()
    var secondNumber = Float()
    var result = Float()
    var operation = ""
    var typingNumber = false
    var typingOperation = false
    
    @IBAction func number(sender: AnyObject) {
        let number = sender.currentTitle
    
        if typingNumber == true {
            if screen.text == "0" {
                screen.text = number
            } else {
                screen.text = screen.text! + number!!
            }
        } else {
            screen.text = number
        }
        
        typingNumber = true
        
        secondNumber = (screen.text! as NSString).floatValue
        
        if operation == "＋" {
            result = firstNumber + secondNumber
        } else if operation == "−" {
            result = firstNumber - secondNumber
        } else if operation == "×" {
            result = firstNumber * secondNumber
        } else if operation == "÷" {
            result = firstNumber / secondNumber
        } else if operation == "%" {
            result = (firstNumber / secondNumber) / 100
        }
    }
    
    @IBAction func operation(sender: AnyObject) {
        operation = sender.currentTitle!!
        
        if typingOperation == true {
            firstNumber = result
        } else {
            firstNumber = (screen.text! as NSString).floatValue
        }
        
        screen.text = "0"
        typingOperation = true
    }
    
    @IBAction func opposite(sender: AnyObject) {
        if Float(screen.text!) > 0 {
            screen.text = "-" + screen.text!
        } else {
            screen.text = screen.text
        }
    }
    
    @IBAction func point(sender: AnyObject) {
        let dot = sender.currentTitle
    
        screen.text = screen.text! + dot!!
    }
    
    @IBAction func equal(sender: AnyObject) {
        typingNumber = false
    
//        if operation == "＋" {
//            result = firstNumber + secondNumber
//        } else if operation == "−" {
//            result = firstNumber - secondNumber
//        } else if operation == "×" {
//            result = firstNumber * secondNumber
//        } else if operation == "÷" {
//            result = firstNumber / secondNumber
//        } else if operation == "%" {
//            result = (firstNumber / secondNumber) / 100
//        }
        
        if result == Float(Int(result)) {
            screen.text = "\(Int(result))"
        } else {
            screen.text = "\(result)"
        }
    }
    
    @IBAction func allClear(sender: AnyObject) {
        firstNumber = 0
        secondNumber = 0
        result = 0
        operation = ""
        typingOperation = false
        typingNumber = false
        screen.text = "0"
    }
}

