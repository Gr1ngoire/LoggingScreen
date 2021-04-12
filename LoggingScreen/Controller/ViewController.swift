//
//  ViewController.swift
//  LoggingScreen
//
//  Created by admin on 09.04.2021.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    
    // adding necessary otlets
    @IBOutlet weak var nameInput: UITextField!
    @IBOutlet weak var passwordInput: UITextField!
    
    @IBOutlet weak var logInButton: UIButton!
    @IBOutlet weak var forgottenNameButton: UIButton!
    @IBOutlet weak var forgottenPasswordButton: UIButton!
    
    @IBOutlet weak var alarmMessageLabel: UILabel!
    // authentication access variable
    var access = false
    
    // passwords and names database
    let passwordData: [String : String] = [
        "Mykola" : "88005553535",
        "Voland" : "666666666",
        "Sherlock" : "BakerStreet221B"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Alarm label preset
        alarmMessageLabel.isHidden = true
        
        // Inputs presets
        self.passwordInput.delegate = self
        passwordInput.addDoneButtonOnKeyboard()
        
        self.nameInput.delegate = self
        nameInput.addDoneButtonOnKeyboard()
    }


    
    // turning password into dots
    @IBAction func showHidePasswordButton(_ sender: Any) {
        if passwordInput.isSecureTextEntry {
            passwordInput.isSecureTextEntry = false
        } else {
            passwordInput.isSecureTextEntry = true
        }
    }
    
    // Log in Button
    @IBAction func logInButtonAction(_ sender: UIButton) {
        
        alarmMessageLabel.isHidden = true
        
        // Cheking for text fields not to be empty
        guard nameInput.text != "", passwordInput.text != "" else {
            return
        }
        
        // Cheking name and password to be in database
        if let passwordValue = passwordData[nameInput.text!], passwordValue == passwordInput.text {
            access = true
        } else {
            access = false
        }
        
    }
    
    // Forgotten name button
    @IBAction func forgottenNameButton(_ sender: UIButton) {
        // email confirmation name
        
        // getting and converting names from database to check if it exists there
        let dataValues = passwordData.values
        var convertedDataValues: [String] = []
        for value in dataValues{
            convertedDataValues.append(String(value))
        }
        
        
        // getting and converting names from database to output the name then
        let dataKeys = passwordData.keys
        var convertedDataKeys: [String] = []
        for key in dataKeys{
            convertedDataKeys.append(String(key))
        }
        
        // Getting needed index to find out if such element exists
        var goForward = false
        var neededIndex = -1
        if let _ = convertedDataValues.firstIndex(of: passwordInput.text!) {
            goForward = true
            neededIndex = convertedDataValues.firstIndex(of: passwordInput.text!)!
        }
        
        
        if !passwordInput.text!.isEmpty, goForward{
            alarmMessageLabel.text = "Email message: authentication name is \(convertedDataKeys[neededIndex])"
            alarmMessageLabel.isHidden = false
        } else {
            alarmMessageLabel.text = "If you have forgotten NAME, enter your PASSWORD and you will get confirmation NAME on your email"
            alarmMessageLabel.isHidden = false
        }
        
    }
    
    // Forgotten password button
    @IBAction func forgottenPasswordButton(_ sender: UIButton) {
        
        if !nameInput.text!.isEmpty, let neededPassword = passwordData[nameInput.text!] {
            alarmMessageLabel.text = "Email message: authentication password is \(neededPassword)"
            alarmMessageLabel.isHidden = false
        } else {
            alarmMessageLabel.text = "If you have forgotten PASSWORD, enter your NAME and you will get confirmation PASSWORD on your email"
            alarmMessageLabel.isHidden = false
        }
    }
    
    // Overriding the prepare function
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let redVC = segue.destination as! RedViewController
        
        if access {
            redVC.text = "Welcome, \(nameInput.text!)"
        } else if !nameInput.text!.isEmpty || !passwordInput.text!.isEmpty {
            redVC.text = "There is no such name or password in the database"
        }
        else {
            redVC.text = "You have to pass the authentication"
        }
    }
}


// extension for adding button
extension UITextField{
    func addDoneButtonOnKeyboard() {
        let doneToolBar: UIToolbar = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width,  height: 50))
        doneToolBar.barStyle = .default
        
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let done: UIBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(self.doneButtonAction))
        
        let items = [flexSpace, done]
        doneToolBar.items = items
        doneToolBar.sizeToFit()
        
        self.inputAccessoryView = doneToolBar
    }
    
    @objc func doneButtonAction() {
        self.resignFirstResponder()
    }
    

}
