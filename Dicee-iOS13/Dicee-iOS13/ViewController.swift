//
//  ViewController.swift
//  Dicee-iOS13
//
//  Created by Angela Yu on 11/06/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var dice_image_view: UIImageView!
    @IBOutlet weak var dice_image_view_2: UIImageView!
    
    let diceArray = [#imageLiteral(resourceName: "DiceOne"), #imageLiteral(resourceName: "DiceTwo"), #imageLiteral(resourceName: "DiceThree"), #imageLiteral(resourceName: "DiceFour"), #imageLiteral(resourceName: "DiceFive"), #imageLiteral(resourceName: "DiceSix")]
    @IBAction func roll_button_pressed(_ sender: UIButton) {
        dice_image_view.image = diceArray.randomElement()
        dice_image_view_2.image = diceArray.randomElement()
    }
}
