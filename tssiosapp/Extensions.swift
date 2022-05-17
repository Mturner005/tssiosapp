//
//  Extensions.swift
//  tssiosapp
//
//  Created by Michael Turner on 10/27/21.
//

import Foundation
import UIKit

extension UIImageView {
    func load(urlString: String) {
        guard let url = URL(string: urlString) else {
            return
        }
        DispatchQueue.global().async {
            if let data = try? Data(contentsOf: url){
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self.image = image
                    }
                }
            }
        }
    }
}
