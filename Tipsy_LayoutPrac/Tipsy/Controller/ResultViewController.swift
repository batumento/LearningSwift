//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Batuhan Emiroğlu on 14.03.2024.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    var numberPeople: Int?
    var tipPerct: Float?
    var perPerson: Float?

    @IBOutlet weak var settingsLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = String(format: "%.2f", perPerson ?? 0.0)
        settingsLabel.text = "Split between \(numberPeople!) people, with \(Int(tipPerct!))% tip."
    }
    
    @IBAction func recalculatePressed(_ sender: Any) 
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
