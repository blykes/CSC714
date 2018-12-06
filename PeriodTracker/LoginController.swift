//
//  LoginController.swift
//  PeriodTracker
//
//  Created by Brian Lykes on 11/4/18.
//  Copyright © 2018 Brian Lykes. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import FirebaseAuth



/* Class for each view controller. Each class is inherited from UIKit library
 and UIViewController classes. Command+click UIViewController for details.
 */
class LoginController: UIViewController {
    
    //stores username
    //@IBOutlet weak var userName: UITextField!
    //@IBOutlet weak var email: UITextField!
    @IBOutlet weak var user: UITextField!
    
    // stores Password
    //@IBOutlet weak var passWord: UITextField!
   // @IBOutlet weak var passWord: UITextField!
   // @IBOutlet weak var pass: UITextField!
    
    @IBOutlet weak var pass: UITextField!
    
    //stanadard view function override
    override func viewDidLoad() {
        super.viewDidLoad()
    }
  
    /// When user taps login button the login paramters are passed to Firebase using the Auth function and verified. If correct user is presented witht he home screen, if failed presented with an error.
    ///
    /// - Parameter sender: Strings: user and pass from textfield
    @IBAction func loginTapped(_ sender: Any) {
       // navigateToMainInterface()
  
        if self.user.text == "" || self.pass.text == "" {
            
            //Alert to tell the user that there was an error because they didn't fill anything in the textfields because they didn't fill anything in
            let alertController = UIAlertController(title: "Error", message: "Please enter a valid username and password", preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            
            self.present(alertController, animated: true, completion: nil)
            
        } else {
            
            Auth.auth().signIn(withEmail: self.user.text!, password: self.pass.text!) { (user, error) in
               
                if error == nil {
                    //prints to the console if succesful login
                    print("You have logged in")
                   
                    //go to main tab controller if login successful
                    let mainTabController = self.storyboard?.instantiateViewController(withIdentifier: "MainTabController") as! MainTabController
                    self.present(mainTabController, animated: true, completion: nil)
                } else {
                    let alertController = UIAlertController(title: "Error" , message: error?.localizedDescription, preferredStyle: .alert)
                    
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }
    }
}
