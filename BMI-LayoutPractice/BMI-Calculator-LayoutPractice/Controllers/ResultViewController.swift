//
//  ResultViewController.swift
//  BMI-Calculator-LayoutPractice
//
//  Created by Batuhan Emiroğlu on 13.03.2024.
//  Copyright © 2024 App Brewery. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    var calcBMI: CalculatorBrain?

    @IBOutlet weak var adviceLabel: UILabel!
    @IBOutlet weak var bmiLabel: UILabel!
    override func viewDidLoad() 
    {
        super.viewDidLoad()
        bmiLabel.text = calcBMI?.getBMI()
        adviceLabel.text = calcBMI?.getAdvice()
        self.view.backgroundColor = calcBMI?.getColor()
    }

    @IBAction func recalculateButton(_ sender: UIButton)
    {
        self.dismiss(animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
