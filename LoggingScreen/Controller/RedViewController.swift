//
//  RedViewController.swift
//  LoggingScreen
//
//  Created by admin on 12.04.2021.
//

import UIKit

class RedViewController: UIViewController {

    @IBOutlet weak var infoLabel: UILabel!
    
    var text: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        infoLabel.text = text
        // Do any additional setup after loading the view.
    }
    

    @IBAction func goToMainScreen(_ sender: Any) {
        dismiss(animated: true)
    }
    
}
