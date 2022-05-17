//
//  CustomEventViewController.swift
//  tssiosapp
//
//  Created by Michael Turner on 10/31/21.
//

import Foundation
import UIKit
import IterableSDK

class CustomEventViewController: UIViewController {


    @IBOutlet weak var redButton: UIButton!
    @IBOutlet weak var yellowButton: UIButton!
    @IBOutlet weak var blueButton: UIButton!
    @IBOutlet weak var orangeButton: UIButton!
    @IBOutlet weak var greenButton: UIButton!
    @IBOutlet weak var purpleButton: UIButton!
    
    override func viewDidLoad() {
    super.viewDidLoad()
        
        
    }
    
    @IBAction func redButtonPressed(_ sender: UIButton) {
        IterableAPI.track(
            event: "coloredButtonClicked",
            dataFields: ["buttonColor": "red"]
        )
    }
    
    @IBAction func yellowButtonPressed(_ sender: UIButton) {
        IterableAPI.track(
            event: "coloredButtonClicked",
            dataFields: ["buttonColor": "yellow"]
        )
    }
    
    @IBAction func blueButtonPressed(_ sender: UIButton) {
        IterableAPI.track(
            event: "coloredButtonClicked",
            dataFields: ["buttonColor": "blue"]
        )
        let payload = IterableAPI.lastPushPayload
        print(payload as Any)
    }
    
    @IBAction func orangeButtonPressed(_ sender: UIButton) {
        IterableAPI.track(
            event: "coloredButtonClicked",
            dataFields: ["buttonColor": "orange"]
        )
    }
    
    @IBAction func greenButtonPressed(_ sender: UIButton) {
        IterableAPI.track(
            event: "coloredButtonClicked",
            dataFields: ["buttonColor": "green"]
        )
    }
    
    @IBAction func purpleButtonPressed(_ sender: UIButton) {
        IterableAPI.track(
            event: "coloredButtonClicked",
            dataFields: ["buttonColor": "purple"]
        )
    }
    
}
