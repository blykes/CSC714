//
//  ThirdViewController.swift
//  PeriodTracker
//
//  Created by Brian Lykes on 10/20/18.
//  Copyright © 2018 Brian Lykes. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import FirebaseAuth


class ThirdViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //view.backgroundColor = .blue
    }
    @IBAction func logoutTapped(_ sender: Any) {
    //function that logs out and return to login/register controller UIButton
        if Auth.auth().currentUser != nil{
            do {
                try Auth.auth().signOut()
                let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "InitialScreen")
                present(vc, animated: true, completion:nil)
            } catch let error as NSError {
                print (error.localizedDescription)
            }
        }
    }
    
}

