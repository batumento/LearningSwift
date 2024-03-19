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
            let task = urlSession.dataTask(with: url)
            { data, response, error in
                if error != nil
                {
                    return
                }
                if let safeData = data
                {
                    self.parseJSON(weitherData: safeData)
                }
            }
            
            task.resume()
        }
    }

    func parseJSON(weitherData: Data)
    {
        let decoder = JSONDecoder()
        do
        {
            let decodedData = try decoder.decode(WeitherData.self, from: weitherData)
            print(decodedData.weather[0].description)
        }
        catch
        {
            print(error)
        }
    }
}
