//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Hanna Putiprawan on 2/22/21.
//

import Foundation

class CalculatorLogic {
    
    var number: Double
    
    init(number: Double) {
        self.number = number
    }
    
    func calculate(symbol: String) -> Double? {
        if symbol == "+/-" {
            return number * -1
        }
        if symbol == "AC" {
            return 0
        }
        if symbol == "%" {
            return number / 100
        }
        return 0
    }

}
