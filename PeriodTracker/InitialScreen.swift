//
//  InitialScreen.swift
//  PeriodTracker
//
//  Created by Brian Lykes on 11/4/18.
//  Copyright © 2018 Brian Lykes. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import FirebaseAuth



/* Class for eahc view controller. Each class is inherited from UIKit library
 and UIViewController classes. Command+click UIViewController for details.
 */

class InitialScreen: UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        //view.backgroundColor = .red
        //will set background color but will not set nav section. Custom Pink color settings
        //view.backgroundColor = UIColor(red: 255/255, green: 192/255, blue: 203/255, alpha: 1)
    }
    //sets custom color for nav bar
/*    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //self.navigationController?.navigationBar.barTintColor = .red
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 255/255, green: 192/255, blue: 203/255, alpha: 1)
       // view.backgroundColor = UIColor(red: 255/255, green: 192/255, blue: 203/255, alpha: 1)
    }*/
    //TODO: passes to login screen via view controller to auth user
    @IBAction func liginTapped(_ sender: Any) {
    }
    //TODO: passes to register screen to rgister user for app
    @IBAction func registerTaped(_ sender: Any) {
    }
    
    //TODO: resets password
    @IBAction func resetPassword(_ sender: Any) {
    }
    
    
}
