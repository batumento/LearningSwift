//
//  ViewController.swift
//  BMI-Calculator-LayoutPractice
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {

    var bmiValue: String?
    @IBOutlet weak var weightSlider: UISlider!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func heightChanged(_ sender: UISlider)
    {
        let heightValue = String(format: "%.2f", sender.value / 100)
        heightLabel.text = "\(heightValue)m"
    }

    @IBAction func weightChanged(_ sender: UISlider)
    {
        let weightValue = Int(sender.value)
        weightLabel.text = "\(weightValue)Kg"
    }
    @IBAction func calculateButton(_ sender: UIButton) 
    {
        let height = heightSlider.value / 100
        let weight = weightSlider.value
        let bmi = weight / pow(height, 2)
        bmiValue = String(format: "%.1f", bmi)

        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult"
        {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.bmiValue = self.bmiValue
        }
    }
}

