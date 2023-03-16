//
//  ViewController.swift
//  LoginApp
//
//  Created by Юрий Белов on 12.02.2023.
//

import UIKit

class LogInViewController: UIViewController {
    
    
    
    @IBOutlet var userNameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    

    private let user = User.getUserData()
    
//    override func viewDidLoad() {
//         super.viewDidLoad()
//        userNameTextField.text = user.login
//        passwordTextField.text = user.password
//    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let tabBarController = segue.destination as? UITabBarController else { return }
        guard let viewControllers = tabBarController.viewControllers else { return }
        
        viewControllers.forEach {
            if let welcomeVC = $0 as? WelcomeViewController {
                welcomeVC.user = user
            } else if let navigationVC = $0 as? UINavigationController {
                guard
                    let userInfoVC = navigationVC.topViewController as? UserInfoViewController
                else { return }
                userInfoVC.user = user
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    @IBAction func logInPressed() {
        guard userNameTextField.text == user.login, passwordTextField.text == user.password else {
            showAlert(
                title: "Oops!",
                message: "Your login or password is incorrect",
                textField: passwordTextField
            )
            return
        }
        performSegue(withIdentifier: "showWelcomeVC", sender: nil)
    }
    
    @IBAction func forgotUserNamePressed() {
        showAlert(title: "Oops!", message: "Your name is \(user.login) 😺")
    }
    
    @IBAction func forgotPasswordPressd() {
        showAlert(title: "Oops!", message: "Your password is \(user.password) 🙀")
    }
    
    @IBAction func unwind(segue: UIStoryboardSegue) {
        passwordTextField.text = ""
        userNameTextField.text = ""
    }
    
    private func showAlert(title: String, message: String, textField: UITextField? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            textField?.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
}


