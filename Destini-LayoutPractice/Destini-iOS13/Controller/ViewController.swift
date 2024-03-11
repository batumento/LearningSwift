//
//  ViewController.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var choice2Button: UIButton!
    @IBOutlet weak var choice1Button: UIButton!
    @IBOutlet weak var storyLabel: UILabel!

    let storyBrain = StoryBrain()
    var storyNumber: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    @IBAction func choiceMade(_ sender: UIButton) {
        if sender == choice1Button
        {
            storyNumber = storyBrain.storyArray[storyNumber].choice1Destination
        }
        else
        {
            storyNumber = storyBrain.storyArray[storyNumber].choice2Destination
        }
        updateUI()
    }
    func updateUI()
    {
        storyLabel.text = storyBrain.storyArray[storyNumber].text
        choice1Button.setTitle(storyBrain.storyArray[storyNumber].choice1, for: .normal)
        choice2Button.setTitle(storyBrain.storyArray[storyNumber].choice2, for: .normal)
    }
}

