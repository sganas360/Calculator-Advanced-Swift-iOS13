//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Shun Ganas on 3/21/23.
//  Copyright © 2023 London App Brewery. All rights reserved.
//

import Foundation

struct CalculatorLogic {
    
    private var number: Double?
    private var intermediateCalculation: (operation: String, firstNum: Double)?
    
    mutating func setNumber(_ number: Double) {
        self.number = number
    }
    
    mutating func calculate (symbol: String) -> Double? {
        if let n = number {
            switch symbol {
            case "+/-":
                return n * -1.0
            case "AC":
                return 0
            case "%":
                return n / 100
            case "=":
                return performTwoNumCalculation(secondNum: n)
            default:
                intermediateCalculation = (operation: symbol, firstNum: n)
            }
        }
        return nil
    }
        
        private func performTwoNumCalculation(secondNum: Double) -> Double? {
            if let firstNum = intermediateCalculation?.firstNum, let operation = intermediateCalculation?.operation {
                switch operation {
                case "+":
                    return firstNum + secondNum
                case "-":
                    return firstNum - secondNum
                case "×":
                    return firstNum * secondNum
                case "÷":
                    return firstNum / secondNum
                default:
                    fatalError("The operation passed in does not match any of the cases.")
                }
            }
            return nil
        }
    }
    
