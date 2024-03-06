//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var labelName: UILabel!
    let eggTimes = ["Soft": 5, "Medium": 420, "Hard": 720]

    var secondsRemaining:Int = 0
    var timer = Timer()
    @IBAction func hardnessSelected(_ sender: UIButton) {
        timer.invalidate()
        secondsRemaining = eggTimes[sender.currentTitle!]!
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (Timer) in
                if self.secondsRemaining > 0
                {
                    print ("\(self.secondsRemaining) seconds")
                    self.secondsRemaining -= 1
                }
                else
                {
                    self.labelName.text = "Finished"
                    Timer.invalidate()
                }
            }
    }
    
}
