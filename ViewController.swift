//
//  ViewController.swift
//  calculator
//
//  Created by Людмилко on 17.11.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var display: UILabel!
    
    var userIsInTheMiddleOfTyping = false
    
    
    @IBAction func touchDigit(_ sender: UIButton) {
        if let title = sender.titleLabel?.text {
            let textCurrentlyInDisplay = display.text!
            if userIsInTheMiddleOfTyping {
                display.text = textCurrentlyInDisplay + title
            } else {
                display.text = title
                userIsInTheMiddleOfTyping = true
            }
        }
    }
        
        var displayValue: Double {
            get {
                return Double(display.text!)!
            }
            set {
                display.text = String(newValue)
            }
        }
    
    private var brain = CalculatorBrain()
    
    @IBAction func performOperation(_ sender: UIButton) {
        if userIsInTheMiddleOfTyping {
            brain.setOperand(displayValue)
            userIsInTheMiddleOfTyping = false
        }
        if let mathimaticalSymbol =  sender.titleLabel?.text {
            brain.performOperation(mathimaticalSymbol)
        }
        if let result = brain.result {
            displayValue = result
        }
    }
}
        


