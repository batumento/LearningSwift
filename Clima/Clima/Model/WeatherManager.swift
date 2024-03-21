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
    protocol WeatherManagerDelegate
    {
        func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel)
        func didFailWithError(error: Error)
    }

    let apiKey = ProcessInfo.processInfo.environment["API_KEY"] ?? ""
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?units=metric"

    var delegate: WeatherManagerDelegate?
    func fetchWeather(cityName: String?)
    {
        let urlString = "\(weatherURL)&q=\(cityName!)&appid=\(apiKey)"
        performRequest(with: urlString)
    }

    func fetchWeather(latitude: Double?, longitude: Double?)
    {
        let urlString = "\(weatherURL)&lat=\(latitude!)&lon=\(longitude!)&appid=\(apiKey)"
        performRequest(with: urlString)
    }

    func performRequest(with urlString: String)
    {
        if let url = URL(string: urlString)
        {
            let urlSession = URLSession(configuration: .default)
            let task = urlSession.dataTask(with: url)
            { data, response, error in
                if error != nil
                {
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                if let safeData = data
                {
                    if let weather = self.parseJSON(safeData)
                    {
                        self.delegate?.didUpdateWeather(self, weather: weather)
                    }
                }
            }
            task.resume()
        }
    }

    func parseJSON(_ weatherData: Data) -> WeatherModel?
    {
        let decoder = JSONDecoder()
        do
        {
            let decodedData = try decoder.decode(WeitherData.self, from: weatherData)
            let id = decodedData.weather[0].id
            let temp = decodedData.main.temp
            let name = decodedData.name
            let weather = WeatherModel(conditionID: id, temp: temp, name: name)
            return weather
        }
        catch
        {
            self.delegate?.didFailWithError(error: error)
            return nil
        }
    }
}
