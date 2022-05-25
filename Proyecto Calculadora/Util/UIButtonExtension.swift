//
//  UIButtonExtension.swift
//  Proyecto Calculadora
//
//  Created by levi on 21/05/22.
//

import UIKit

//CODIGO RGB DE NARANJA
private let orange = UIColor(red:254/255, green: 148/255, blue: 0/255, alpha: 1)

extension UIButton {
    
    //BORDE REDONDO DE LOS NUMEROS Y SIMBOLOS
    func round() {
        layer.cornerRadius = bounds.height / 2
        clipsToBounds = true
    }
    
    //BRILLOS DE EFECTO AL PULSAR LOS BOTONES
    func shine() {
        UIView.animate(withDuration: 0.1, animations: {
            self.alpha = 0.5
        }) { (completion) in
            UIView.animate(withDuration: 0.1, animations: {
                self.alpha = 1
            })
    }
 }
    //APARIENCIA SELECCION BONTON DE OPERACION
    func selectOperation(_ selected:Bool){
        backgroundColor = selected ? .white : orange
        setTitleColor(selected ? orange : .white, for:  .normal)
    }
}
