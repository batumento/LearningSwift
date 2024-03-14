//
//  CalculatorBrain.swift
//  BMI-Calculator-LayoutPractice
//
//  Created by Batuhan Emiroğlu on 14.03.2024.
//  Copyright © 2024 App Brewery. All rights reserved.
//

import UIKit

struct CalculatorBrain
{
    var bmi: BMI?

    mutating func calculateBMI(height: Float, weight: Float)
    {
        let color = (underweight: #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1), healthy: #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1), overheight: #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1))
        let bmiValue = weight / pow(height, 2)
        if bmiValue < 18.5
        {
            bmi = BMI(value: bmiValue, advice: "Eat more kebab!", color: color.underweight)
        }
        else if bmiValue < 24.9
        {
            bmi = BMI(value: bmiValue, advice: "Fit as a fiddle!", color: color.healthy)
        }
        else
        {
            bmi = BMI(value: bmiValue, advice: "Eat less kebab!", color: color.overheight)
        }
    }

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
        return String(format: "%.1f", self.bmi?.value ?? "0.0")
    }

    func getAdvice() -> String
    {
        return bmi?.advice ?? "Error: No Advice"
    }

    func getColor() -> UIColor
    {
        return bmi?.color ?? .red
    }
}
