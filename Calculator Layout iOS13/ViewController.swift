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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func calcButtonPressed(_ sender: UIButton) {
        isCalcButtonPressed = true
    }
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        if let numValue = sender.currentTitle {
            if !isCalcButtonPressed {
                if let label = displayLabel.text {
                    displayLabel.text = label == "0" ? numValue : "\(displayLabel.text!)\(numValue)"
                }
            }else{
                displayLabel.text = numValue
                isCalcButtonPressed = false
            }
        }
    }
}

