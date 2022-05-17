//
//  LogsViewController.swift
//  tssiosapp
//
//  Created by Michael Turner on 10/23/21.
//

import UIKit
import AVFoundation

class LogsViewController: UIViewController {
    
    var player: AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    
    @IBAction func logsButtonPressed(_ sender: UIButton) {
        
        let soundNameFile = "logs"
        
        playSound(soundName: soundNameFile)
        sender.alpha = 0.5
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            // Bring's sender's opacity back up to fully opaque
            sender.alpha = 1.0
          }
        
    }
    
    func playSound(soundName: String) {
        let url = Bundle.main.url(forResource: soundName, withExtension: "wav")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
                
    }
}
