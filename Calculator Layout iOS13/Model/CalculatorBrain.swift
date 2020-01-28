//
//  CalculatorBrain.swift
//  Calculator Layout iOS13
//
//  Created by user161182 on 1/27/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

struct CalculatorBrain {
    
    private var displayValue : String = "0"
    
    private var calculatorValue : Double? {
        
        get{
            guard let number = Double(displayValue) else {
                fatalError("Cannot convert display label text to a Double")
            }
            return number
        }
        set{
            displayValue = String(newValue)
        }
        
    }
    
    private var isCalcButtonPressed : Bool = false
    
    private var isDecimalButtonPressed : Bool = false
    
    mutating func calculationButton(operation : String) {
        
        isCalcButtonPressed = true
        isDecimalButtonPressed = false
        
        if operation == "+/-" {
            calculatorValue *= -1
        }
        else if operation == "%" {
            calculatorValue /= 100.0
        }
        else if operation == "AC" {
            calculatorValue = 0
        }
    }
    
    mutating func numberButton(btnTitle : String){
        
        if !isCalcButtonPressed {
            //Esse if e pra evitar que varios pontos de decimal sejam inseridos no display
            if !(btnTitle == "." && isDecimalButtonPressed){
                displayValue = displayValue == "0" ? btnTitle : "\(displayValue)\(btnTitle)"
            }
            isDecimalButtonPressed = btnTitle == "." ? true : isDecimalButtonPressed
        }else{
            displayValue = btnTitle
            isCalcButtonPressed = false
        }
        
    }
    
    func getDisplayValue() -> String {
        return displayValue
    }
}
