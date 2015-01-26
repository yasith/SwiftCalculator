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
    
    @IBAction func operate(sender: UIButton) {
        let operation = sender.currentTitle!
        if isUserTyping {
            enter()
        }
        
        switch operation {
        
        case "+": performOperation {$0 + $1}
        case "-": performOperation {$1 - $0}
        case "×": performOperation {$0 * $1}
        case "÷": performOperation {$1 / $0}
        case "√": performOperation {sqrt($0)}
            
        default:
            break
        }
    }
    
    func performOperation(operation : (Double, Double) -> Double) {
        if operandStack.count >= 2 {
            displayValue = operation(operandStack.removeLast(), operandStack.removeLast())
            enter()
        }
    }
    
    func performOperation(operation : Double -> Double) {
        if operandStack.count >= 1 {
            displayValue = operation(operandStack.removeLast())
            enter()
        }
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

