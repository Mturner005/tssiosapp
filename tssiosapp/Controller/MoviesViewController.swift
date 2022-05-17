//
//  TimeZonesViewController.swift
//  tssiosapp
//
//  Created by Michael Turner on 10/23/21.
//

import UIKit
import Foundation

class MoviesViewController: UIViewController {
    
    
    
    @IBOutlet weak var moviePoster: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!   
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let page = Int.random(in: 1...5)
        let apiKey = "f2a0a5d696643f2469707bd7c80755dc"
        let url = "https://api.themoviedb.org/4/list/7070509?page=\(page)&api_key=\(apiKey)"
        getData(From: url)
        
        
    }
    
    private func getData(From url: String){
        let task = URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: { data, response, error in
            
            guard let data = data, error == nil else {
                print("something went wrong")
                return
            }
            
            var result: Response?
            do {
                result = try JSONDecoder().decode(Response.self, from: data)
            }
            catch {
                print("failed to convert \(error.localizedDescription)")
            }
            
            guard let json = result else {
                return
            }
            
            DispatchQueue.main.async {
                self.movieTitle.text = json.results[0].title
                let imageUrl = "https://image.tmdb.org/t/p/w500\(json.results[0].poster_path)"
                self.moviePoster.load(urlString: imageUrl)
                print(json.results[0].poster_path)
            }
            
            
        })
        
        task.resume()
        
        
    }
    
    struct Response: Codable {
        let results: [Results]
    }

    struct Results: Codable {
        let title: String
        let poster_path: String
    }
}
