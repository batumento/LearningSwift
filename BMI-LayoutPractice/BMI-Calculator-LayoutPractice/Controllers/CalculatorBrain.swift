//
//  CalculatorBrain.swift
//  BMI-Calculator-LayoutPractice
//
//  Created by Batuhan Emiroğlu on 14.03.2024.
//  Copyright © 2024 App Brewery. All rights reserved.
//

import Foundation

struct CalculatorBrain
{
    var bmi: Float = 0

    func getWeight(weight: Float) -> String
    {
        let convertWeight = Int(weight)
        return "\(convertWeight)Kg"
    }

    func getHeight(height: Float) -> String
    {
        let convertHeight = String(format: "%.2f", height / 100)
        return "\(convertHeight)m"
    }

    func getBMI() -> String
    {
        return String(format: "%.1f", bmi)
    }

    mutating func calculateBMI(height: Float, weight: Float)
    {
        self.bmi = weight / pow(height, 2)
        print("\(bmi): aall")
    }
}
