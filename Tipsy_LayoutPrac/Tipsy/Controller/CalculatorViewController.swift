//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    var tipPercantage: String?
    var billValue: Float?
    var numberOfPeople: Int?
    @IBOutlet weak var splitNumberLabel: UILabel!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var billTextField: UITextField!

    override func viewDidLoad() 
    {
        tipPercantage = String(tenPctButton.currentTitle!.dropLast())
        numberOfPeople = Int(splitNumberLabel.text!)
    }

    @IBAction func tipChanged(_ sender: UIButton)
    {
        billTextField.endEditing(true)
        clearSelect()
        sender.isSelected = true
        tipPercantage = String(sender.currentTitle!.dropLast())
    }

    @IBAction func stepperPressed(_ sender: UIStepper) 
    {
        numberOfPeople = Int(sender.value)
        splitNumberLabel.text = String(numberOfPeople!)

    }

    @IBAction func calculatePressed(_ sender: UIButton)
    {
        var int_pct = Float(tipPercantage!) ?? 0
        int_pct = int_pct / 100
        billValue = Float(billTextField.text?.replacingOccurrences(of: ",", with: ".") ?? "0.0")
        let personBill = billValue! / Float(numberOfPeople!)
        let addPct = personBill + (personBill * int_pct)
        print(addPct)
        performSegue(withIdentifier: "goToResult", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            _ = segue.destination as! ResultViewController
            //
        }
    }
    func clearSelect()
    {
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
    }
}

