//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    var bill = 0.0
    var tip = 0.10
    var numberOfSplit = 2
    var resultShortDecimal = ""
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!

    @IBAction func tipChanged(_ sender: UIButton) {
        //dismiss keyboard
        billTextField.endEditing(true)
        
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        sender.isSelected = true
        
        let buttonTitle = sender.currentTitle!
        let buttonTitleWithoutSign = buttonTitle.dropLast()
        let buttonTitleAsNumber = Double(buttonTitleWithoutSign)!
        tip = buttonTitleAsNumber / 100
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        numberOfSplit = Int(sender.value)
        splitNumberLabel.text = String(numberOfSplit)
        
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        // Get text user typed
        let billText = billTextField.text!
        
        if billText != ""{

            bill = Double(billText)!
            
            let result = bill * (1 + tip) / Double(numberOfSplit)
            resultShortDecimal = String(format: "%.2f", result)
        }
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "goToResult"{
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.result = resultShortDecimal
            destinationVC.tip = tip
            destinationVC.numberOfSplit = numberOfSplit
        }
    }
}

