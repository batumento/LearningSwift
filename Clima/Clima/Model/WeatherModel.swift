//
//  WeatherModel.swift
//  Clima
//
//  Created by Batuhan Emiroğlu on 19.03.2024.
//  Copyright © 2024 App Brewery. All rights reserved.
//

import Foundation

struct WeatherModel
{
    let conditionID: Int
    let temp: Double
    let name: String
    
    var temperatureString: String
    {
        return String(format: "%.1f", temp)
    }
    var conditionName: String
    {
        switch conditionID 
        {
        case 200...232:
            return "cloud.bolt"
        case 300...321:
            return "cloud.drizzle"
        case 500...531:
            return "cloud.rain"
        case 600...622:
            return "cloud.snow"
        case 701...781:
            return "cloud.fog"
        case 800:
            return "sun.max"
        case 801...804:
            return "cloud.bolt"
        default:
            return "cloud"
        }
    }
}
