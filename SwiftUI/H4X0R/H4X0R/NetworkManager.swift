//
//  NetworkManager.swift
//  H4X0R
//
//  Created by Batuhan Emiroğlu on 5.04.2024.
//

import Foundation

class NetworkManager : ObservableObject
{
    @Published var posts = [Post]()
    func fetchData()
    {
        if let url = URL(string: "https://hn.algolia.com/api/v1/search?tags=front_page")
        {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error == nil
                {
                    if let safeData = data
                    {
                        let decoder = JSONDecoder()
                        do
                        {
                            let result = try decoder.decode(Results.self, from: safeData)
                            DispatchQueue.main.async
                            {
                                self.posts = result.hits
                            }
                        }
                        catch
                        {
                            print(error)
                        }
                    }
                }
            }
            task.resume()
        }
    }
}
