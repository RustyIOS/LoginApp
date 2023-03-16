//
//  UserInfoViewController.swift
//  LoginApp
//
//  Created by Юрий Белов on 13.03.2023.
//

import UIKit

class UserInfoViewController: UIViewController {
    
    @IBOutlet var photoImage: UIImageView! {
        didSet {
            photoImage.layer.cornerRadius = photoImage.frame.height / 2
        }
    }
    
    @IBOutlet var nameLabal: UILabel!
    @IBOutlet var lastNameLabal: UILabel!
    
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        photoImage.image = UIImage(named: user.person.photo)
        title = user.person.fullName
        nameLabal.text = user.person.firstName
        lastNameLabal.text = user.person.lastName
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let imageVC = segue.destination as? UserBioViewController else { return }
        imageVC.user = user
    }
}
