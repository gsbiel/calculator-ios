

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var displayLabel: UILabel!
    
    // Propriedades do tipo "private" sao acessiveis apenas no escopo da classe onde estao declaradas.
    // Assim, toda propriedade que for usada apenas como controle de estado dentro de uma classe pode ser declarada como privada, para evitar que sejam acessadas por instancias de outras classes.
    
    
    private var calculatorBrain = CalculatorBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func calcButtonPressed(_ sender: UIButton) {
        calculatorBrain.calculationButton(operation: sender.currentTitle!)
        updateDisplay()
    }
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        calculatorBrain.numberButton(btnTitle: sender.currentTitle!)
        updateDisplay()
    }
    
    private func updateDisplay() {
        displayLabel.text = calculatorBrain.getDisplayValue()
    }
}

