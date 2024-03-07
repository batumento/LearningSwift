//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var timerBar: UIProgressView!
    @IBOutlet weak var labelName: UILabel!

    let eggTimes = ["Soft": 5, "Medium": 420, "Hard": 720]
    var secondsRemaining:Int = 0
    var timer = Timer()
    var progressB:Float = 0
    var finishOfSound: AVAudioPlayer?
    @IBAction func hardnessSelected(_ sender: UIButton) {
        timer.invalidate()
        progressB = 0
        self.timerBar.progress = 0
        secondsRemaining = eggTimes[sender.currentTitle!]!
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (Timer) in
                if self.secondsRemaining > 0
                {
                    self.progressB += 1
                    self.timerBar.progress = self.progressB / Float(self.eggTimes[sender.currentTitle!]!)
                    print ("\(self.secondsRemaining) seconds")
                    self.secondsRemaining -= 1
                }
                else
                {
                    self.playSound()
                    self.progressB = 0
                    self.labelName.text = "Finished"
                    Timer.invalidate()
                }
            }
    }
    func playSound()
    {
        let path = Bundle.main.path(forResource: "alarm_sound", ofType: "mp3")
        let url = URL(fileURLWithPath: path!)
        do {
            finishOfSound = try AVAudioPlayer(contentsOf: url)
            finishOfSound?.play()
        } catch {
           print("Error for load sound")
        }
    }
}
