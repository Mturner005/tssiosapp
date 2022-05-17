//
//  ViewController.swift
//  tssiosApp
//
//  Created by Michael Turner on 10/01/2021.
//

import UIKit
import Firebase
import IterableSDK

class RegisterViewController: UIViewController {
    
    
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    
    @IBAction func registerPressed(_ sender: UIButton) {
        
        if let email = emailTextfield.text, let password = passwordTextfield.text{
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                if let e = error {
                    self.errorLabel.text = e.localizedDescription
                } else {
                    //registerDevice Token with Iterable
                    IterableAPI.email = email
                    //NavigateToDashboardViewController
                    self.performSegue(withIdentifier: "RegisterToDashboard", sender: self)
                }
            }
        }
        
    }
}
