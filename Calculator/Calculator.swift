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
        
        if label == "CE" {
            displayValue = "0"
            reset()
        } else if label == "=" {
            equalClicked()
        } else if label == "." {
            decimalClicked()
        } else if let value = Double(label) {
            numberPressed(value: value)
        } else {
            operatorPressed(op: Operator(label))
        }
    }
    
    
    func setDisplayValue(number: Double) {
        // Don't dispaly a decimal if the number is an integer
        if number == floor(number) {
            displayValue = "\(Int(number))"
        
        // Otherwise, display a decimal
        } else {
            let decimalPlace = 10
            displayValue = "\(round(number * pow(10, decimalPlace)) / pow(10, decimalPlace))"
            
        }
    }
    
    
    // Reset the state of calculator
    func reset() {
        currentOp = nil
        currentNumber = 0
        previousNumber = nil
        equaled = false
        decimalPlace = 0
    }
    
    func equalClicked() {
        
    }
    
    func decimalClicked() {
        
    }
    
    func numberPressed(value: Double) {
        
        // if equal was pressed, clear the current numbers
        if equaled {
            currentNumber = nil
            previousNumber = nil
            equaled = false
        }
        
        // If there is no current number, set it to the value
        if currentNumber == nil {
            currentNumber = value / pow(10, decimalPlace)
        
        
        // Otherwise, add the value to the current number
        } else {
            // If no decimal was typed, add the value as the last digit of the number
            if decimalPlace == 0 {
                currentNumber = currentNumber! * 10 + value
                
                // Otherwise, add the value as the last decimal of the number
            } else {
                currentNumber = currentNumber! * value / pow(10, decimalPlace)
                decimalPlace += 1
            }
        }
        // Update the UI
        setDisplayValue(number: currentNumber!)
    }
    
    func operatorPressed(op: Operator) {
        
         // Reset the decimal
        decimalPlace = 0
        
        // If equals was pressed, resest the current number
        if equaled {
            currentNumber = nil
            equaled = false
        }
        
        // If we have two operands, compute them
        if currentNumber != nil && previousNumber != nil {
            let total = currentOp!.op(previousNumber!, currentNumber!)
            previousNumber = total
            currentNumber = nil
            
            // Uptate the UI
            setDisplayValue(number: total)
            
        // If only one number has been given, move it to the second operand
        } else if previousNumber == nil {
            previousNumber = currentNumber
            currentNumber = nil
        }
        
        currentOp = op
    }
}

func pow(_ base: Int, _ exp: Int) -> Double {
    return pow(Double(base), Double(exp))
}
