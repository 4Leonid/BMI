//
//  CalculatorBrain.swift
//  BMI
//
//  Created by Леонид Турко on 16.04.2023.
//

import Darwin
import UIKit

struct CalculatorBrain {
  var bmi: BMI?
  
  mutating func calculateBMI(height: Float, weight: Float) {
    let bmiValue = weight / pow(height, 2)
    switch bmiValue {
    case 0..<18.5:
      bmi = BMI(value: bmiValue, advice: "Eat more pies", color: .cyan)
    case 18.5..<24.9:
      bmi = BMI(value: bmiValue, advice: "Eat more pies", color: .green)
    case 24.9...:
      bmi = BMI(value: bmiValue, advice: "Eat more pies", color: .magenta)
    default: break
    }
  }
  
  func getBMIValue() -> String {
    String(format: "%.1f", bmi?.value ?? 0.0)
  }
  
  func getAdvice() -> String {
    bmi?.advice ?? ""
  }
  
  func getColor() -> UIColor {
    bmi?.color ?? .white
  }
}
