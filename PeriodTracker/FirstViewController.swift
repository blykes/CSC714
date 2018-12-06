//
//  FirstViewController.swift
//  PeriodTracker
//
//  Created by Brian Lykes on 10/7/18.
//  Code by Minh Doan
//  Copyright © 2018 Brian Lykes. All rights reserved.
//

import Foundation
import UIKit
import UserNotifications

class FirstViewController: UIViewController {
    
    let step:Float=5
    let numberFormatter = NumberFormatter()
    
    @IBOutlet weak var dateInput: UITextField!
    @IBOutlet weak var dateInput2: UITextField!
    
    @IBOutlet weak var happinessSlider: UISlider!
    @IBOutlet weak var happinessLabel: UILabel!
    
    @IBOutlet weak var predictionButton: UIButton!
    
    @IBOutlet weak var predictPeriodLabel: UILabel!
    
    var datePicker: UIDatePicker!
    let model = period()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UNUserNotificationCenter.current().delegate = self as? UNUserNotificationCenterDelegate
        datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 0
        
        datePicker.frame = CGRect(x: 10, y: 50, width: self.view.frame.width, height: 200)
        datePicker.backgroundColor = UIColor.white
        
        let toolBar = UIToolbar().ToolbarPiker(mySelect: #selector(FirstViewController.dismissPicker))
        
        
        datePicker.addTarget(self, action: #selector(handleDatePicker(_:)), for: UIControl.Event.valueChanged)
        
        dateInput.tag = 1
        dateInput.delegate = self as UITextFieldDelegate
        dateInput.inputAccessoryView = toolBar
        
        dateInput2.tag = 2
        dateInput2.delegate = self as UITextFieldDelegate
        dateInput2.inputAccessoryView = toolBar
        
        updateValues()
        UILocalNotification()
        
    }
    
    @objc func handleDatePicker(_ sender: UIDatePicker) {
        // Create date formatter
        let dateFormatter: DateFormatter = DateFormatter()
        
        // Set date format
        dateFormatter.dateFormat = "MM/dd/yyyy"
        
        // Apply date format
        let selectedDate: String = dateFormatter.string(from: datePicker.date)
        
        if datePicker.tag == 1 {
            dateInput.text = selectedDate
            print(datePicker.tag," ",selectedDate)
        }
        else if (datePicker.tag == 2) {
            dateInput2.text = selectedDate
            print(datePicker.tag," ",selectedDate)
        }
        
    }
    
    @IBAction func updateValues() {
        DispatchQueue.main.async {
            self.updateLabels();
            //self.predictPeriod();
        }
    }
    
    func updateLabels() {
        happinessLabel.text = "Stress Level: \(numberFormatter.string(for: happinessSlider.value) ?? "0")"
    }
    @objc func dismissPicker() {
        
        view.endEditing(true)
        
    }
    
    @IBAction func predictHandler(_ sender: Any) {
        let predictedData = (dateInput2.text)!
        
        let data = convertNumbersToArray(predictedData)
        if predictedData .isEmpty{
            predictPeriodLabel.text = " Please select the month and year you would like us to predict"
        }
        else{
            predictPeriod(data)
            
        }
    }
    func predictPeriod(_ data: [Double]) {
        
        if let prediction = try? model.prediction(year: Double(data[2]), month: Double(data[0]), happiness: Double(happinessSlider.value)) {
            predictPeriodLabel.text = "Prediction: \(Int(data[0])) \\ \(prediction.period)"
        }
    }
    
    func convertNumbersToArray(_ date: String) -> [Double] {
        var featureData = [Double]()
        let dateMonthYear = date.split(separator: "/")
        for item in dateMonthYear {
            featureData.append(Double(item)!)
        }
        return featureData
    }
    
    func createNotification(){
        let content = UNMutableNotificationContent()
        content.title = "Title"
        content.body = "Every 10 seconds"
        content.sound = UNNotificationSound.default
        
        var dateComponents = DateComponents()
        dateComponents.calendar = Calendar.current
        
       // dateComponents.second = 10
        // date1.hour = 0
        // date1.minute = 1
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        
        print(dateComponents)
        //let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)
        
        let request = UNNotificationRequest(identifier: "testIdentifier", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request){
            (error) in
            print(error as  Any)
        }
    }
}

extension FirstViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.inputView = datePicker
        datePicker.tag = textField.tag
    }
}


