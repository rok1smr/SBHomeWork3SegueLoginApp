//
//  LoginViewController.swift
//  SBHomeWork3SegueLoginApp
//
//  Created by Konstantin on 26.10.2021.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func logInButtonPressed(_ sender: UIButton) {
        guard userNameTextField.text == "User" else {
            showAlert(title: "Wrong User Name or Password", message: "Please check your entries")
            userNameTextField.text = ""
            passwordTextField.text = ""
            return
        }
        guard passwordTextField.text == "Password" else {
            showAlert(title: "Wrong User Name or Password", message: "Please check your entries")
            userNameTextField.text = ""
            passwordTextField.text = ""
            return
        }
    }
    
    
    @IBAction func forgotUserNameButtonPressed(_ sender: UIButton) {
        showAlert(title: "Your User Name is:", message: "User")
    }
    
    @IBAction func forgorPasswordButtonPressed(_ sender: UIButton) {
        showAlert(title: "Your Password is:", message: "Password")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeViewController else { return }
        guard userNameTextField.text == "User" else { return }
        guard passwordTextField.text == "Password" else { return }
        welcomeVC.userGreetinLabel = userNameTextField.text
        userNameTextField.text = ""
        passwordTextField.text = ""
    }
}

extension LoginViewController {
    private func showAlert(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            self.userNameTextField.text = ""
            self.passwordTextField.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
