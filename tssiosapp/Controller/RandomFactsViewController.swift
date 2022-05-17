//
//  RandomFactsViewController.swift
//  tssiosapp
//
//  Created by Michael Turner on 10/27/21.
//

import UIKit
import Foundation

class RandomFactsViewController: UIViewController {
    
    
    
    
    
    @IBOutlet weak var factLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "https://uselessfacts.jsph.pl/today.json?language=en")
        
        guard url != nil else {
            print("Error creating url")
            return
        }
        
        var request = URLRequest(url: url!, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10)
        
        request.httpMethod = "GET"
        
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: request) { data, response, error in
            
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
                self.factLabel.text = json.text
            }
            
        }
        
        dataTask.resume()
    }
    
    struct Response: Codable {
        let text: String
    }
}
