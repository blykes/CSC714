//
//  ResetPassword.swift
//  PeriodTracker
//
//  Created by Brian Lykes on 11/20/18.
//  Copyright © 2018 Brian Lykes. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import FirebaseAuth


class ResetPassword: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    //outlets
    @IBOutlet weak var emailField: UITextField!
    
    //Reset password Function
    @IBAction func resetPassword(_ sender: Any) {
        
        if self.emailField.text == "" {
            let alertController = UIAlertController(title: "Oops!", message: "Please enter a valid email", preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            
            present(alertController, animated: true, completion: nil)
        } else {
            Auth.auth().sendPasswordReset(withEmail: self.emailField.text!, completion: {(error) in
                var title = ""
                var message = ""
                
                if error != nil {
                    title = "Error!"
                    message = (error?.localizedDescription)!
                } else {
                    title = "Sucess!"
                    message = "Password reset email sent."
                    self.emailField.text = ""
                }
                
                let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
                
                let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alertController.addAction(defaultAction)
                
                self.present(alertController, animated: true, completion: nil)
            })
        }
    }
    
}
