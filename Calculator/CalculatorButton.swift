//
//  CalculatorButton.swift
//  Calculator
//
//  Created by Yasuko Kurata on 2021-02-09.
//

import SwiftUI

struct CalculatorButton: View {
    var label: String
    var color: Color
    
    var body: some View {
        Button(action: {
            // Inform model of button press
        }, label: {
            ZStack {
                Circle()
                    .fill(color)
                Text(label)
                    .font(.title)
            }
        })
        // White color button
        .accentColor(.white)
    }
}

struct CalculatorButton_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorButton(label: "1", color: .gray)
            .previewLayout(.fixed(width: 100, height: 100))
    }
}
