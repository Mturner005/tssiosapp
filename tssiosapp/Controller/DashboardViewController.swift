//
//  ViewController.swift
//  tssiosApp
//
//  Created by Michael Turner on 10/01/2021.
//

import UIKit
import Firebase
import IterableSDK


class DashboardViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
    }
    
    @IBAction func logOutPressed(_ sender: UIBarButtonItem) {
        
        let firebaseAuth = Auth.auth()
    do {
      try firebaseAuth.signOut()
        navigationController?.popToRootViewController(animated: true)
        IterableAPI.disableDeviceForCurrentUser()
    } catch let signOutError as NSError {
      print("Error signing out: %@", signOutError)
    }
      
    }
    
    @IBAction func weatherButtonPressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: "DashboardToWeather", sender: self)
    }
    @IBAction func logsButtonPressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: "DashboardToLogs", sender: self)
    }
    @IBAction func timeZonesButtonPressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: "DashboardToTimeZones", sender: self)
    }
    @IBAction func moviesButtonPressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: "DashboardToMovies", sender: self)
    }
    @IBAction func jokesButtonPressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: "DashboardToJokes", sender: self)
    }
    @IBAction func randomFactsButtonPressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: "DashboardToRandomFacts", sender: self)
    }
    @IBAction func customEventsButtonPressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: "DashboardToCustomEvents", sender: self)
    }
    @IBAction func mobileInboxButtonPressed(_ sender: UIButton) {
        let viewController = IterableInboxNavigationViewController()
        viewController.noMessagesTitle = "No Saved Messages"
        viewController.noMessagesBody = "Check Again Later!"
        viewController.navTitle = "My Inbox"
        present(viewController, animated: true)
    }
}
