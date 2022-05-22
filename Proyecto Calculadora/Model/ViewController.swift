//
//  ViewController.swift
//  Proyecto Calculadora
//
//  Created by levi on 20/05/22.
//

import UIKit

class ViewController: UIViewController {
    
    //RESULTADO
    @IBOutlet weak var resultLabel: UILabel!
    
    //NUMEROS
    @IBOutlet weak var number0: UIButton!
    @IBOutlet weak var number1: UIButton!
    @IBOutlet weak var number2: UIButton!
    @IBOutlet weak var number3: UIButton!
    @IBOutlet weak var number4: UIButton!
    @IBOutlet weak var number5: UIButton!
    @IBOutlet weak var number6: UIButton!
    @IBOutlet weak var number7: UIButton!
    @IBOutlet weak var number8: UIButton!
    @IBOutlet weak var number9: UIButton!
    @IBOutlet weak var numberDecimal: UIButton!
    
    
    
    //OPERADORES
    @IBOutlet weak var operatorAC: UIButton!
    @IBOutlet weak var operatorPlusMinus: UIButton!
    @IBOutlet weak var operatorPercent: UIButton!
    @IBOutlet weak var operatorResult: UIButton!
    @IBOutlet weak var operatorAddition: UIButton!
    @IBOutlet weak var operatorSubtraction: UIButton!
    @IBOutlet weak var operatorMultiplication: UIButton!
    @IBOutlet weak var operatorDivision: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    //BUTTON ACTION
    
    @IBAction func operatorACAction(_ sender: Any) {
        
        
    }
    @IBAction func operatorPlusMinusAction(_ sender: Any) {
        
        
}
    @IBAction func operatorPercentAction(_ sender: Any) {
        
        
    }
        @IBAction func operatorResultAction(_ sender: Any) {
            
            
        }
            @IBAction func operatorAdditionAction(_ sender: Any) {
                
                
            }
                @IBAction func operatorSubtractionAction(_ sender: Any) {
                    
                    
                }
                    @IBAction func operatorMultiplicationAction(_ sender: Any) {
                        
                        
                    }
                        @IBAction func operatorDivisionAction(_ sender: Any) {
                            
                            
                        }
        
    @IBAction func numberDecimalAction(_ sender: Any) {
    }

    
    @IBAction func numberAction(_ sender: UIButton) {
        print(sender.tag)
    }
    
}
