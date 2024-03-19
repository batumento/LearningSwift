//
//  WeitherData.swift
//  Clima
//
//  Created by Batuhan Emiroğlu on 19.03.2024.
//  Copyright © 2024 App Brewery. All rights reserved.
//

import Foundation

struct WeitherData: Decodable
{
    let name: String
    let id: Int
    let main: Main
    let weather: [Weather]
}

struct Main: Decodable
{
    let temp: Double
}

struct Weather: Decodable
{
    let id: Int
    let description: String
}
