//
//  Calculator.swift
//  Calculator
//
//  Created by Yasuko Kurata on 2021-02-10.
//

import Foundation

class Calculator: ObservableObject {
    
    // Used to update the UI
    @Published var displayValue = "0"
    
    // Store the current operator
    var currentOp: Operator?
    
    // Curent number selected
    var currentNumber: Double? = 0
    
    // Previous number selected
    var previousNumber: Double?
    
    // Flag for equal press
    var equaled = false
    
    // How many decimal places have been typed
    var decimalPlace = 0
    
    // Select the appropriate function based on the label of the button pressed
    func buttonPressed(label: String) {
        
    }
    
    func reset() {
        
    }
    
    func equalClicked() {
        
    }
    
    func decimalClicked() {
        
    }
    
    func numberPressed(value: Double) {

    }
    
    func operatorPressed(op: Operator) {
        
    }
}
