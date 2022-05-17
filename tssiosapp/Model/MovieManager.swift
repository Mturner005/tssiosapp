//
//  MovieManager.swift
//  tssiosapp
//
//  Created by Michael Turner on 10/25/21.
//

import Foundation

protocol MovieManagerDelegate {
    func didUpdateMovie(_ movieManager: MovieManager, weather: WeatherModel)
    func didFailWithError(error: Error)
}

let apiKey = "f2a0a5d696643f2469707bd7c80755dc"
let page = Int.random(in: 0..<6)

struct MovieManager {
    
    let movieUrl = "https://api.themoviedb.org/4/list/7070509?page=\(page)&api_key=\(apiKey)"
    
    func fetchMovie() {
        let urlString = movieUrl
        performRequest(urlString: urlString)
    }
    
    func performRequest(urlString: String) {
        //1. Create a URL
        if let url = URL(string: urlString) {
            //2. Create a URLSession
            let session = URLSession(configuration: .default)
            
            //3. Give the session a task
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error!)
                    return
                }
                if let safeData = data {
                    self.parseJSON(movieData: safeData)
                }
            }
            
            //4. Start the task
            task.resume()
        }
        
        
    }
    
    func parseJSON(movieData: Data) {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(MovieData.self, from: movieData)
            print(decodedData.results[0].title)
        } catch {
            print(error)
        }
    
}
}
