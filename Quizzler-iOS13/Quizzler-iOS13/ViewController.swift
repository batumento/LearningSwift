//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!

    var quiz = ["2 + 2 = 4": "True", "4 + 4 = 9": "False", "3 + 1 = 4": "True"]
    var anyQuestion: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        anyQuestion = quiz.randomElement()?.key
        questionLabel.text = anyQuestion
    }

    @IBAction func answerButton(_ sender: UIButton) {
        sender.isUserInteractionEnabled = false
        if sender.currentTitle! == quiz[anyQuestion!]{
            questionLabel.text = "Correct"
            sender.backgroundColor = UIColor.green
        }
        else
        {
            questionLabel.text = "Wrong"
            sender.backgroundColor = UIColor.red
        }
    }
}

