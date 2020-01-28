

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var displayLabel: UILabel!
    
    // Propriedades do tipo "private" sao acessiveis apenas no escopo da classe onde estao declaradas.
    // Assim, toda propriedade que for usada apenas como controle de estado dentro de uma classe pode ser declarada como privada, para evitar que sejam acessadas por instancias de outras classes.
    
    private var isCalcButtonPressed : Bool = false
    private var isDecimalButtonPressed : Bool = false
    
    private var calculatorBrain = CalculatorBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func calcButtonPressed(_ sender: UIButton) {
        isCalcButtonPressed = true
        isDecimalButtonPressed = false
        
        if let displayNumber = Double(displayLabel.text!) {
            calculatorBrain.setNumberAndOperation(displayNumber, operation: sender.currentTitle!)
        }else {
            // What should happen if the number inserted is not a number?
        }
        
        if sender.currentTitle == "=" || sender.currentTitle == "AC"  {
            showResult()
        }

    }
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        if let btnTitle = sender.currentTitle {
            if !isCalcButtonPressed {
                //Esse if e pra evitar que varios pontos de decimal sejam inseridos no display
                if !(btnTitle == "." && isDecimalButtonPressed){
                    displayLabel.text = displayLabel.text! == "0" ? btnTitle : "\(displayLabel.text!)\(btnTitle)"
                }
                isDecimalButtonPressed = btnTitle == "." ? true : isDecimalButtonPressed
            }else{
                displayLabel.text = btnTitle
                isCalcButtonPressed = false
            }
        }
    }
    
    private func showResult() {
        let result = calculatorBrain.getResult()
        displayLabel.text = result
    }
        
}

