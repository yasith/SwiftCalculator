//
//  ViewController.swift
//  SwiftCalculator
//
//  Created by Yasith Vidanaarachchi on 2015-01-25.
//  Copyright (c) 2015 Yasith Vidanaarachchi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var display: UILabel!
    
    var isUserTyping = false
    var operandStack = Array<Double>()

    @IBAction func digit(sender: UIButton) {
        let digit = sender.currentTitle!
        
        if isUserTyping{
            display.text = display.text! + digit
        } else {
            display.text = digit
            isUserTyping = true
        }
    }
    
    @IBAction func enter() {
        operandStack.append(displayValue)
        isUserTyping = false
        
        println("\(operandStack)")
    }
    
    var displayValue : Double {
        get {
            return NSNumberFormatter().numberFromString(display.text!)!.doubleValue
        }
        set {
            display.text = "\(newValue)"
            isUserTyping = false
        }
    }
}

