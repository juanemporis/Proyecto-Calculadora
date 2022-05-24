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
    
    //VARIABLES
    private var total: Double = 0 //total
    private var temp: Double = 0 //valor por pantalla
    private var operating = false //Indicar si se ha selecionado un operador
    private var decimal = false //Indica si el valor es decimal
    private var operation: OperationType = .none //Operacion actual
    
    //CONSTANTES
    private let KDecimalSeparator = Locale.current.decimalSeparator!//la K se agrega adelante para saber que es un valor mutable
    
    private let KMaxLenght = 9 //Numero maximo de numeros
    private let KmaxValue = 999999999 //Numero maximo visible en la calculadora
    private let KMinValue = 0.00000001//Numero minimo visivble en la calculadora
    
    
    private enum OperationType{
        case none, addiction, substraction, multiplication, division, percent
    }
    
    //Formateo de valores auxiliares
    private let auxFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        let locale = Locale.current
        formatter.groupingSeparator = ""
        formatter.numberStyle = .decimal
        return formatter
    }()
    
    //Formateo de valores por pantalla por defecto
    private let printFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        let locale = Locale.current
        formatter.groupingSeparator = locale.groupingSeparator
        formatter.groupingSeparator = locale.decimalSeparator
        formatter.numberStyle = .decimal
        formatter.maximumIntegerDigits = 9
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 8
        return formatter
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //UI
        number0.round ()
        number1.round ()
        number2.round ()
        number3.round ()
        number4.round ()
        number5.round ()
        number6.round ()
        number7.round ()
        number8.round ()
        number9.round ()
        numberDecimal.round ()
        
        operatorAC.round ()
        operatorPlusMinus.round ()
        operatorPercent.round ()
        operatorResult.round ()
        operatorAddition.round ()
        operatorSubtraction.round ()
        operatorMultiplication.round ()
        operatorDivision.round ()
        
        numberDecimal.setTitle(KDecimalSeparator, for: .normal)
        
        result()
    }

    //BUTTON ACTION
    
    @IBAction func operatorACAction(_ sender: UIButton) {
        sender.shine()

    }
    @IBAction func operatorPlusMinusAction(_ sender: UIButton) {
        sender.shine()

}
    @IBAction func operatorPercentAction(_ sender: UIButton) {
        sender.shine()

    }
        @IBAction func operatorResultAction(_ sender: UIButton) {
            sender.shine()

        }
            @IBAction func operatorAdditionAction(_ sender: UIButton) {
                sender.shine()

            }
                @IBAction func operatorSubtractionAction(_ sender: UIButton) {
                    sender.shine()

                }
                    @IBAction func operatorMultiplicationAction(_ sender: UIButton) {
                        sender.shine()
                    }
                        @IBAction func operatorDivisionAction(_ sender: UIButton) {
                            sender.shine()
                            

                        }
    
    @IBAction func numberDecimalAction(_ sender: UIButton) {
        sender.shine()

    }

    @IBAction func numberAction(_ sender: UIButton) {
        sender.shine()
        print(sender.tag)
    }
    
    //CODIGO PARA RESOLVER LAS OPERACIONES Y CALCULAR EL RESULTADO TOTAL Y MOSTRARLO EN PANTALLA
    
    //Limpia los valores
    private func clear (){
        operation = .none
        operatorAC.setTitle("AC", for: .normal)
        
        if temp >= 0{
            temp = 0
            resultLabel.text = "0"
        }else{
            total = 0
            result()
        }
    }
    //RESULTADO FINAL
    private func result(){
     
        //El break se encargara de detener la ejecución dentro de las llaves o bloques
        switch operation {
            
        case .none:
            //No hacemos nada
            break
        case .addiction:
            total = total + temp
            break
        case .substraction:
            total = total - temp
            break
        case .multiplication:
            total = total * temp
            break
        case .division:
            total = total / temp
            break
        case .percent:
            temp = temp / 100
            total = temp
            break
        }
        //Formateo en pantalla
        if total <= KMinValue || total >= KMinValue{
            resultLabel.text = printFormatter.string(from: NSNumber(value: total))
        }
        print("TOTAL: \(total)")
    }
}
                  
