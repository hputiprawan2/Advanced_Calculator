//
//  ViewController.swift
//  Calculator
//
//  Created by Hanna Putiprawan on 02/19/2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    private var isFinishTypingNumber: Bool = true
    private var displayValue: Double {
        get {
            guard let number = Double(displayLabel.text!) else {
                fatalError("Cannot convert display label text to a Double.")
            }
            return number
        }
        
        set {
            displayLabel.text = String(newValue)
        }
    }
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        //What should happen when a non-number button is pressed
        isFinishTypingNumber = true
        
        if let calcMethod = sender.currentTitle {
            if calcMethod == "+/-" {
                displayValue *= -1
            }
            if calcMethod == "AC" {
                displayLabel.text = "0"
            }
            if calcMethod == "%" {
                displayValue /= 100
            }
        }
    }

    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        //What should happen when a number is entered into the keypad
        if let numValue = sender.currentTitle {
            if isFinishTypingNumber {
                displayLabel.text = numValue
                isFinishTypingNumber = false
            } else {
                // Make decimal point able to show only once
                if  numValue == "." {
                    let isInt = floor(displayValue) == displayValue
                    
                    if !isInt {
                        return
                    }
                }
                displayLabel.text = displayLabel.text! + numValue
            }
        }
    
    }

}

