//
//  ViewController.swift
//  Calculator Layout iOS13
//
//  Created by Angela Yu on 01/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var displayLabel: UILabel!
    
    // Propriedades do tipo "private" sao acessiveis apenas no escopo da classe onde estao declaradas.
    // Assim, toda propriedade que for usada apenas como controle de estado dentro de uma classe pode ser declarada como privada, para evitar que sejam acessadas por instancias de outras classes.
    private var isCalcButtonPressed : Bool = false
    private var isDecimalButtonPressed : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func calcButtonPressed(_ sender: UIButton) {
        isCalcButtonPressed = true
        isDecimalButtonPressed = false
        
        guard let number = Double(displayLabel.text!) else {
            fatalError("Cannot convert display label text to Double")
        }
        
        if let calcMethod = sender.currentTitle {
            if calcMethod == "+/-" {
                displayLabel.text = String(number * -1)
            }
            else if calcMethod == "%" {
                displayLabel.text = String(number/100.0)
            }
            else if calcMethod == "AC" {
                displayLabel.text = "0"
            }
            
        }
    }
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        if let numValue = sender.currentTitle {
            if !isCalcButtonPressed {
                if let label = displayLabel.text {
                    //Esse if e pra evitar que varios pontos de decimal sejam inseridos no display
                    if !(numValue == "." && isDecimalButtonPressed){
                        displayLabel.text = label == "0" ? numValue : "\(displayLabel.text!)\(numValue)"
                    }
                    isDecimalButtonPressed = numValue == "." ? true : isDecimalButtonPressed
                    print(isDecimalButtonPressed)
                }
            }else{
                displayLabel.text = numValue
                isCalcButtonPressed = false
                isCalcButtonPressed = false
            }
        }
    }
}

