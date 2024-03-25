//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

protocol CoinManagerDelegate: AnyObject {
    func didWithFailError(_ error: Error)
    func getCurrencyPrice(_ price: Double, _ currency: String)
}

struct Security: Codable
{
    let API_KEY: String
}

struct CoinManager {

    let apiURL = Bundle.main.url(forResource: "Security", withExtension: "plist")!
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]

    var delegate: CoinManagerDelegate?

    private func getAPI() -> String
    {
        do
        {
            let data = try Data(contentsOf: apiURL)
            let result = try PropertyListDecoder().decode(Security.self, from: data)
            return result.API_KEY
        } catch { return "Check Security.plist"}
    }

    func getCoinPrice(for currency: String)
    {
        performRequest(currencyD: currency)
    }

    func performRequest(currencyD: String)
    {
        let apiKey = getAPI()
        if let url = URL(string: "\(baseURL)/\(currencyD)?apikey=\(apiKey)")
        {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    self.delegate?.didWithFailError(error!)
                    return
                }
                if let safeData = data
                {
                    if let coinData = parseJSON(data: safeData)
                    {
                        self.delegate?.getCurrencyPrice(coinData.rate, currencyD)
                    }
                }
            }
            task.resume()
        }
    }

    func parseJSON(data: Data) -> CoinData?
    {
        print(data)
        let decoder = JSONDecoder()
        do
        {
            let decodedData = try decoder.decode(CoinData.self, from: data)
            return decodedData
        }
        catch
        {
            self.delegate?.didWithFailError(error)
            return nil
        }
    }
}
