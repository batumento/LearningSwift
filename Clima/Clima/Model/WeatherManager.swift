//
//  WeatherManager.swift
//  Clima
//
//  Created by Batuhan Emiroğlu on 18.03.2024.
//  Copyright © 2024 App Brewery. All rights reserved.
//

import Foundation

struct  WeatherManager
{
    let apiKey = ProcessInfo.processInfo.environment["API_KEY"] ?? ""
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?units=metric"

    func fetchWeather(cityName: String?)
    {
        let urlString = "\(weatherURL)&q=\(cityName!)&appid=\(apiKey)"
        performRequest(urlString: urlString)
    }
    
    func performRequest(urlString: String)
    {
        if let url = URL(string: urlString)
        {
            let urlSession = URLSession(configuration: .default)
            let task = urlSession.dataTask(with: url, completionHandler: handler(data: response: error: ))
            task.resume()
        }
    }

    func handler(data: Data?, response: URLResponse?, error: Error?)
    {
        if error != nil 
        {
            print(error!)
            return
        }
        if let safeData = data
        {
            let dataString = String(data: safeData, encoding: .utf8)
            print(dataString!)
        }
    }
}
