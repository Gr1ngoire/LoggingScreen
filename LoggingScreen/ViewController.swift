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
    // authentification access variable
    var access = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        alarmMessageLabel.isHidden = true
    }
    
    let passwordData: [String : String] = [
        "Mykola" : "88005553535",
        "Voland" : "666666666",
        "Sherlock" : "BakerStreet221B"
    ]
    

    
    // Overriding the prepare function

    
    
    @IBAction func logInButtonAction(_ sender: UIButton) {
        
        alarmMessageLabel.isHidden = true
        
        // Cheking for text fields not to be empty
        guard nameInput.text != "", passwordInput.text != "" else {
            alarmMessageLabel.text = "You need to enter name AND password"
            alarmMessageLabel.isHidden = false
            return
        }
        
        // Cheking name and password to be in database
        if let passwordValue = passwordData[nameInput.text!], passwordValue == passwordInput.text {
            access = true
        } else {
            access = false
            alarmMessageLabel.text = "There is no such name or password"
            alarmMessageLabel.isHidden = false
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let redVC = segue.destination as! RedViewController
        
        if access {
            redVC.text = "Welcome, \(nameInput.text!)"
        } else {
            redVC.text = "You have to pass the autentification"
        }
    }
}

