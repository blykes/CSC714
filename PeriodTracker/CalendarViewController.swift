//
//  SecondViewController.swift
//  PeriodTracker
//
//  Created by Brian Lykes on 10/7/18.
//  Calendar created by Minh
//  Copyright © 2018 Brian Lykes. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import FirebaseAuth
import FirebaseFirestore
import EventKit

enum MyTheme {
    case light
    case dark
}

class CalendarViewController: UIViewController {
    
    var theme = MyTheme.dark
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "My Calender"
        //self.navigationController?.navigationBar.isTranslucent=false
        self.view.backgroundColor=Style.bgColor
        
        view.addSubview(calenderView)
        calenderView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive=true
        calenderView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -12).isActive=true
        calenderView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 12).isActive=true
        calenderView.heightAnchor.constraint(equalToConstant: 500).isActive=true
        
      /*  let rightBarBtn = UIBarButtonItem(title: "Light", style: .plain, target: self, action: #selector(rightBarBtnAction))
        self.navigationItem.rightBarButtonItem = rightBarBtn */
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        calenderView.myCollectionView.collectionViewLayout.invalidateLayout()
    }
    
    let calenderView: CalenderView = {
        let v=CalenderView(theme: MyTheme.dark)
        v.translatesAutoresizingMaskIntoConstraints=false
        return v
    }()
    
    
}

//SecondViewController.swift
