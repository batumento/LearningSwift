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

    var storyBrain = StoryBrain()
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    @IBAction func choiceMade(_ sender: UIButton) {
        storyBrain.nextStory(sender.currentTitle!)
        updateUI()
    }
    func updateUI()
    {
        storyLabel.text = storyBrain.getStoryLine()
        choice1Button.setTitle(storyBrain.getChoiceTitle(1), for: .normal)
        choice2Button.setTitle(storyBrain.getChoiceTitle(2), for: .normal)
    }
}
