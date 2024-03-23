//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

struct CoinManager {
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = "5267FFD8-C91D-4C3C-BD20-6F57DF1D3E93"
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]

    func getCoinPrice(for currency: String)
    {
        
        performRequest(currencyD: currency)
    }

    func performRequest(currencyD: String)
    {
        if let url = URL(string: "\(baseURL)/\(currencyD)?apikey=\(apiKey)")
        {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    return
                }
                print(String(decoding: data!, as: UTF8.self))
            }
            task.resume()
        }
    }

    func parseJSON(data: Data)
    {
        
    }
}
