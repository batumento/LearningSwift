//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    var percantage: String = "de"
    @IBOutlet weak var splitNumberLabel: UILabel!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var billTextField: UITextField!

    @IBAction func tipChanged(_ sender: UIButton) 
    {
        clearSelect()
        sender.isSelected = true
        print(sender.currentTitle!.split(separator: "%"))
        //En sondaki yüzdeyi almamayı öğren ve float tipindeki değişkene 100 ile bölüp ata
    }
    @IBAction func stepperValueChanged(_ sender: Any) 
    {
        
    }
    @IBAction func calculatePressed(_ sender: Any) 
    {
        
    }

    func clearSelect()
    {
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
    }
}

