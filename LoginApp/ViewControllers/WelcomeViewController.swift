//
//  WelcomeViewComtrollerViewController.swift
//  LoginApp
//
//  Created by Юрий Белов on 15.02.2023.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet var welcomeLabel: UILabel!
    
    var user: User!
    
    var welcomeText = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeLabel.text = "Welcome, \(user.person.fullName)!"
    }
    
}
