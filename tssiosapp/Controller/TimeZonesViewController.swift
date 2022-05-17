//
//  TimeZonesViewController.swift
//  tssiosapp
//
//  Created by Michael Turner on 10/23/21.
//

import UIKit
import Foundation

class TimeZonesViewController: UIViewController {
    
    
    @IBOutlet weak var utcLabel: UILabel!
    @IBOutlet weak var estLabel: UILabel!
    @IBOutlet weak var pstLabel: UILabel!
    @IBOutlet weak var mstLabel: UILabel!
    @IBOutlet weak var bstLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let date = Date()
        
        let formatter = DateFormatter()
        formatter.timeZone = TimeZone(abbreviation: "UTC")
        formatter.dateStyle = .full
        formatter.timeStyle = .full
        formatter.locale = .current
        
        let formatterTwo = DateFormatter()
        formatterTwo.timeZone = TimeZone(abbreviation: "EST")
        formatterTwo.dateStyle = .full
        formatterTwo.timeStyle = .full
        formatterTwo.locale = .current
        
        let formatterThree = DateFormatter()
        formatterThree.timeZone = TimeZone(abbreviation: "PST")
        formatterThree.dateStyle = .full
        formatterThree.timeStyle = .full
        formatterThree.locale = .current
        
        let formatterFour = DateFormatter()
        formatterFour.timeZone = TimeZone(abbreviation: "MDT")
        formatterFour.dateStyle = .full
        formatterFour.timeStyle = .full
        formatterFour.locale = .current
        
        let formatterFive = DateFormatter()
        formatterFive.timeZone = TimeZone(abbreviation: "BST")
        formatterFive.dateStyle = .full
        formatterFive.timeStyle = .full
        formatterFive.locale = .current
        
        utcLabel.text = formatter.string(from: date)
        estLabel.text = formatterTwo.string(from: date)
        pstLabel.text = formatterThree.string(from: date)
        mstLabel.text = formatterFour.string(from: date)
        bstLabel.text = formatterFive.string(from: date)
        
        
        
    }

}
