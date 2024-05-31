//
//  WeatherManager.swift
//  Clima
//
//  Created by Batuhan Emiroğlu on 18.03.2024.
//  Copyright © 2024 App Brewery. All rights reserved.
//

import Foundation

protocol WeatherManagerDelegate
{
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel)
    func didFailWithError(error: Error)
}

//Create your own Key-Value value in the property list with your own API key value.
struct Security: Decodable
{
    //Key name: API Key value
    let API_KEY: String
}

struct  WeatherManager
{
    
    let apiURL = Bundle.main.url(forResource: "Security", withExtension: "plist")!
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?units=metric"

    var delegate: WeatherManagerDelegate?

    private func getAPIKey() -> String
    {
        do
        {
            let data = try Data(contentsOf: apiURL)
            let result = try PropertyListDecoder().decode(Security.self, from: data)
            return result.API_KEY
        }
        catch { return error.localizedDescription }
    }

    func fetchWeather(cityName: String?)
    {
        let apiKey = getAPIKey()
        let urlString = "\(weatherURL)&q=\(cityName!)&appid=\(apiKey)"
        performRequest(with: urlString)
    }

    func fetchWeather(latitude: Double?, longitude: Double?)
    {
        let apiKey = getAPIKey()
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
