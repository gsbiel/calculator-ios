//
//  CalculatorBrain.swift
//  Calculator Layout iOS13
//
//  Created by user161182 on 1/27/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

struct CalculatorBrain {
    
    private var number : Double = 0.0
    
    private var currentOperation : String?
    
    private var result : Double?
    
    private mutating func performCalculation(){
        
        if currentOperation == "+/-" {
            //calculatorValue *= -1
        }
        else if currentOperation == "%" {
            //calculatorValue /= 100.0
        }
        else if currentOperation == "+" {
            if let currentResult = result {
                result = currentResult + number
            }
        }
        else if currentOperation == "-" {
            if let currentResult = result {
                result = currentResult - number
            }
        }
        else if currentOperation == "/" {
            if let currentResult = result {
                result = currentResult / number
            }
        }
        else if currentOperation == "*" {
            if let currentResult = result {
                result = currentResult * number
            }
        }
    }
    
    mutating func setNumberAndOperation(_ number : Double, operation : String){
        
        print("number \(self.number)")
        print("currentOperation \(currentOperation)")
        print("result \(result)")
        
        if operation != "AC" && operation != "=" {
            self.number = number
            
            if let currentResult = result {
                performCalculation()
                currentOperation = operation
            }else{
                //what should happen if the result is nil?
                currentOperation = operation
                result = number
            }
        }else if operation == "AC"{
            result = nil
            currentOperation = nil
            self.number = 0.0
        }else{
            //performCalculation()
            currentOperation = nil
            self.number = result ?? 0.0
        }
        
        print("number \(self.number)")
        print("currentOperation \(currentOperation)")
        print("result \(result)")
    }
    
    func getResult() -> String {
        if let currentResult = result {
            return String(currentResult)
        }
        else {
            return "0"
        }
    }
}
