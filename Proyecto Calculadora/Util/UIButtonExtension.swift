//
//  UIButtonExtension.swift
//  Proyecto Calculadora
//
//  Created by levi on 21/05/22.
//

import UIKit

extension UIButton {
    
    //BORDE REDONDO DE LOS NUMEROS Y SIMBOLOS
    func round() {
        layer.cornerRadius = bounds.height / 2
        clipsToBounds = true
    }
    
    //BRILLOS DE EFECTO AL PULSAR LOS BOTONES
    func shine() {
        UIView.animate(withDuration: 01, animations: {
            self.alpha = 0.5
        }) { (completion) in
            UIView.animate(withDuration: 0.1, animations: {
                self.alpha = 1
            })
    }
 }
}
