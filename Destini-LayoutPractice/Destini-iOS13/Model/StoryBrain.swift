//
//  StoryBrain.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

struct StoryBrain
{
    let storyArray: [Story] =
    [
        Story(text: "You see a fork in the road.", choice1: "Take a Left", choice2: "Take a Right", choice1Destination: 1, choice2Destination: 2),
        Story(text: "You see a tiger.", choice1: "Shout for help", choice2: "Play dead", choice1Destination: 0, choice2Destination: 0),
        Story(text: "You find a treasure chest.", choice1: "Open it", choice2: "Check traps", choice1Destination: 0, choice2Destination: 0)
    ]
}
