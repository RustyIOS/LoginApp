//
//  UserBioViewController.swift
//  LoginApp
//
//  Created by Юрий Белов on 14.03.2023.
//

import UIKit

class UserBioViewController: UIViewController {
    
    @IBOutlet var userBioTextView: UITextView!
    
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userBioTextView.backgroundColor = .clear
        navigationItem.title = "\(user.person.fullName)"
        userBioTextView.text = user.person.userInfo
    }
}

