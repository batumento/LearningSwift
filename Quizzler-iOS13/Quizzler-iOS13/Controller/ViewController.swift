//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!

    var quizBrain = QuizBrain()

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    @IBAction func answerButton(_ sender: UIButton)
    {
        let userAnswer = sender.currentTitle!
        let checkedAnswer = quizBrain.checkAnswer(uAnswer: userAnswer)
        if  checkedAnswer
        {
            quizBrain.incraseScore()
            sender.backgroundColor = UIColor.green
            Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(clearButton), userInfo: nil, repeats: false)
        }
        else
        {
            sender.backgroundColor = UIColor.red
            Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(clearButton), userInfo: nil, repeats: false)
        }
        quizBrain.nextQuestion()
        updateUI()
    }

    func updateUI()
    {
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        progressBar.progress = quizBrain.remainingQuestionBar()
        questionLabel.text = quizBrain.getQuestion()
    }

    @objc func clearButton()
    {
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
    }
}
