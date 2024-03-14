//
//  ViewController.swift
//  BMI-Calculator-LayoutPractice
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {

    var calculatorBrain = CalculatorBrain()

    @IBOutlet weak var weightSlider: UISlider!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func heightChanged(_ sender: UISlider)
    {
        heightLabel.text = calculatorBrain.getHeight(height: sender.value)
    }

    @IBAction func weightChanged(_ sender: UISlider)
    {
        weightLabel.text = calculatorBrain.getWeight(weight: sender.value)
    }
    @IBAction func calculateButton(_ sender: UIButton) 
    {
        calculatorBrain.calculateBMI(height: heightSlider.value / 100, weight: weightSlider.value)
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult"
        {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.bmiValue = calculatorBrain.getBMI()
        }
    }
}
