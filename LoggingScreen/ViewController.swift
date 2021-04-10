//
//  ViewController.swift
//  LoggingScreen
//
//  Created by admin on 09.04.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameInput: UITextField!
    @IBOutlet weak var passwordInput: UITextField!
    
    @IBOutlet weak var logInButton: UIButton!
    @IBOutlet weak var forgottenNameButton: UIButton!
    @IBOutlet weak var forgottenPasswordButton: UIButton!
    
    @IBOutlet weak var alarmMessageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        alarmMessageLabel.isHidden = true
    }
    
    let passwordData: [String : String] = [
        "Mykola" : "88005553535",
        "Voland" : "666666666",
        "Sherlock" : "BakerStreet221B"
    ]

    @IBAction func logInButtonAction(_ sender: UIButton) {
        
        alarmMessageLabel.isHidden = true
        
        guard nameInput.text != "", passwordInput.text != "" else {
            alarmMessageLabel.text = "You need to enter name AND password"
            alarmMessageLabel.isHidden = false
            return
        }
        
        if let passwordValue = passwordData[nameInput.text!], passwordValue == passwordInput.text {
            print("Passed")
        } else {
            alarmMessageLabel.text = "There is no such name or password"
            alarmMessageLabel.isHidden = false
        }
        
    }
}

