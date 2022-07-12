//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Ayeon on 2022/07/12.
//  Copyright © 2022 Angela Yu. All rights reserved.
//

import Foundation
import UIKit

struct CalculatorBrain{
    
    var bmi: BMI?
    
    mutating func calculateBMI(height: Float, weight: Float){
        let bmiValue = weight / (height * height) //pow(height, 2)
        if bmiValue < 18.5{
            bmi = BMI(value: bmiValue, advice: "Eat more!", color: UIColor.blue)
        }else if bmiValue < 24.9{
            bmi = BMI(value: bmiValue, advice: "Fit!", color: UIColor.green)
        }else{
            bmi = BMI(value: bmiValue, advice: "Eat less!", color: UIColor.red)
        }
        
    }
    
    func getBMIValue() -> String{
        //alternative 1
        /*if bmi != nil{
            let stringBmi = String(format: "%.1f", bmi!)
            return stringBmi
        }else{
            return "0.0"
        }*/
        
        //alternative 2
        /*if let safeBmi = bmi{
            let stringBmi = String(format: "%.1f", safeBmi)
            return stringBmi
        }*/
        
        let stringBmi = String(format: "%.1f", bmi?.value ?? 0.0)
        return stringBmi
        
    }
    
    func getAdvice() -> String{
        return bmi?.advice ?? "no comment"
    }
    
    func getColor() -> UIColor{
        return bmi?.color ?? UIColor.white
    }
}
