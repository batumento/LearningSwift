//
//  ViewController.swift
//  Magic 8 Ball
//
//  Created by Angela Yu on 14/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ball_image: UIImageView!
    
    let ballArray = [#imageLiteral(resourceName: "ball1"), #imageLiteral(resourceName: "ball5"), #imageLiteral(resourceName: "ball3.png"), #imageLiteral(resourceName: "ball4"), #imageLiteral(resourceName: "ball5")]

    @IBAction func askButton(_ sender: UIButton) {
        ball_image.image = ballArray.randomElement()
    }
    
}

