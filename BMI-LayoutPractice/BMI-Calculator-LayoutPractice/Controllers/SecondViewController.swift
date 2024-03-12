//
//  SecondViewController.swift
//  BMI-Calculator-LayoutPractice
//
//  Created by Batuhan Emiroğlu on 12.03.2024.
//  Copyright © 2024 App Brewery. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    var bmiValue: String = "0.0"

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        let label = UILabel()
        label.text = bmiValue
        label.textColor = .white
        label.frame = CGRect(x: 100, y: 200, width: 100, height: 25)
        view.addSubview(label)
    }
}
