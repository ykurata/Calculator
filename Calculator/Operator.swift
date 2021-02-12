//
//  Operator.swift
//  Calculator
//
//  Created by Yasuko Kurata on 2021-02-10.
//

import Foundation

class Operator {
    
    var op: (Double, Double) -> Double
    var isDivision = false
    
    init(_ string: String) {
        
        if string == "+" {
            self.op = (+)
        } else if string == "-" {
            self.op = (-)
        } else if string == String("\u{00f7}") {
            self.op = (*)
        } else {
            self.op = (/)
            isDivision = true
        }
    }
}
