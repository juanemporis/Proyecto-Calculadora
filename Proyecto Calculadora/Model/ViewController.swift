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
    //private let KmaxValue = 999999999 //Numero maximo visible en la calculadora
    //private let KMinValue = 0.00000001//Numero minimo visivble en la calculadora
    
    
    private enum OperationType{
        case none, addiction, substraction, multiplication, division, percent
    }
    
    //Formateo de valores auxiliares
    private let auxFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        let locale = Locale.current
        formatter.groupingSeparator = ""
        formatter.decimalSeparator = locale.decimalSeparator
        formatter.numberStyle = .decimal
        formatter.maximumIntegerDigits = 100
        formatter.maximumFractionDigits = 0
        formatter.maximumFractionDigits = 100
        return formatter
    }()
    //Formateo de valores auxiliares
    private let auxTotalFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        let locale = Locale.current
        formatter.groupingSeparator = ""
        formatter.decimalSeparator = ""
        formatter.numberStyle = .decimal
        formatter.maximumIntegerDigits = 100
        formatter.maximumFractionDigits = 0
        formatter.maximumFractionDigits = 100
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
    
    //FORMATEO DE VALORES POR PANTALLA EN FORMATO CIENTIFICO
    private let printScientificFormatter : NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .scientific
        formatter.maximumFractionDigits = 3
        formatter.exponentSymbol = "e"
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
        
        clear()
        
        sender.shine()

    }
    @IBAction func operatorPlusMinusAction(_ sender: UIButton) {
        
        temp = temp * (-1)
        
        resultLabel.text = printFormatter.string(from: NSNumber(value: temp))
        
        sender.shine()

}
    @IBAction func operatorPercentAction(_ sender: UIButton) {
        
        if operation != .percent{
            result()
        }
        operating = true
        operation = .percent
        
        sender.shine()

    }
        @IBAction func operatorResultAction(_ sender: UIButton) {
            
            result()
            
            sender.shine()

        }
            @IBAction func operatorAdditionAction(_ sender: UIButton) {
                if operation != . none {
                    result()
                }
                
                operating = true
                operation = .addiction
                sender.selectOperation(true)
                
                sender.shine()

            }
                @IBAction func operatorSubtractionAction(_ sender: UIButton) {
                    
                    if operation != . none {
                        result()
                    }
                    operating = true
                    operation = .substraction
                    sender.selectOperation(true)

                    sender.shine()

                }
                    @IBAction func operatorMultiplicationAction(_ sender: UIButton) {
                        
                        if operation != . none {
                            result()
                        }
                        operating = true
                        operation = .multiplication
                        sender.selectOperation(true)

                        sender.shine()
                    }
                        @IBAction func operatorDivisionAction(_ sender: UIButton) {
                            
                            if operation != . none {
                                result()
                            }
                            operating = true
                            operation = .division
                            sender.selectOperation(true)

                            sender.shine()
                            

                        }
    
    @IBAction func numberDecimalAction(_ sender: UIButton) {
        
        let currentTemp = auxTotalFormatter.string(from: NSNumber(value: temp))!
        if !operating && currentTemp.count >= KMaxLenght{
            return
        }
        
        resultLabel.text = resultLabel.text! + KDecimalSeparator
        decimal = true
        
        selectVisualOperation()
        
        sender.shine()

    }

    @IBAction func numberAction(_ sender: UIButton) {
        
        operatorAC.setTitle("C", for: .normal)
        var currentTemp = auxTotalFormatter.string(from: NSNumber(value: temp))!
        if !operating && currentTemp.count >= KMaxLenght{
            return
        }
        
        currentTemp = auxFormatter.string(from: NSNumber(value: temp))!
        
        //SELECCION DE UNA OPERACIÓN
        if operating{
            
            total = total == 0 ? temp : total
            resultLabel.text = ""
            currentTemp = ""
            operating = false
        }
        //SELECCION DE DECIMALES
        if decimal{
            currentTemp = "\(currentTemp)\(KDecimalSeparator)"
            decimal = false
            
        }
        let number = sender.tag
        temp = Double(currentTemp + String (number))!
        resultLabel.text = printFormatter.string(from: NSNumber(value: temp))
        
        selectVisualOperation()

        sender.shine()
    
    }
    //CODIGO PARA RESOLVER LAS OPERACIONES Y CALCULAR EL RESULTADO TOTAL Y MOSTRARLO EN PANTALLA
    
    //Limpia los valores
    private func clear (){
        operation = .none
        operatorAC.setTitle("AC", for: .normal)
        
        if temp != 0{
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
        if let currentTotal = auxTotalFormatter.string(from: NSNumber(value: total)), currentTotal.count > KMaxLenght{
            resultLabel.text = printFormatter.string(from: NSNumber(value: total))
        }else{
            resultLabel.text = printFormatter.string(from: NSNumber(value: total))
        }
           
        
        operation = .none
        
        selectVisualOperation()
        
        print("TOTAL: \(total)")
    }
    //MUESTRA DE FORMA VISUAL LA OPERACION SELECCIONADA
    private func selectVisualOperation(){
        
        if !operating{
            //NO ESTAMOS OPERANDO
            operatorAddition.selectOperation(false)
            operatorSubtraction.selectOperation(false)
            operatorMultiplication.selectOperation(false)
            operatorDivision.selectOperation(false)
        }else{
            
            switch operation {
            case.none, .percent:
                operatorAddition.selectOperation(false)
                operatorSubtraction.selectOperation(false)
                operatorMultiplication.selectOperation(false)
                operatorDivision.selectOperation(false)
                break
            case .addiction:
                operatorAddition.selectOperation(true)
                operatorSubtraction.selectOperation(false)
                operatorMultiplication.selectOperation(false)
                operatorDivision.selectOperation(false)
                break
            case .substraction:
                operatorAddition.selectOperation(false)
                operatorSubtraction.selectOperation(true)
                operatorMultiplication.selectOperation(false)
                operatorDivision.selectOperation(false)
                break
            case .multiplication:
                operatorAddition.selectOperation(false)
                operatorSubtraction.selectOperation(false)
                operatorMultiplication.selectOperation(true)
                operatorDivision.selectOperation(false)
                break
            case .division:
                operatorAddition.selectOperation(false)
                operatorSubtraction.selectOperation(false)
                operatorMultiplication.selectOperation(false)
                operatorDivision.selectOperation(true)
                break
           
            }
        }
        
    }
}
                  
