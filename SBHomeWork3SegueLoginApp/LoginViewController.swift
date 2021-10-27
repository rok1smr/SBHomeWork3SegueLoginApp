//
//  LoginViewController.swift
//  SBHomeWork3SegueLoginApp
//
//  Created by Konstantin on 26.10.2021.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginButton.layer.cornerRadius = 10
        userNameTextField.delegate = self
        passwordTextField.delegate = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(sender:)), name: UIResponder.keyboardWillShowNotification, object: nil);

        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(sender:)), name: UIResponder.keyboardWillHideNotification, object: nil);
    }
    
//    implementation of unwind segue in the destination VC
    @IBAction func unwind( _ seg: UIStoryboardSegue) {
    }
    
//    functions neede to shift the contents of the screen when keyboard appears
    @objc func keyboardWillShow(sender: NSNotification) {
         self.view.frame.origin.y = -50 // Move view 150 points upward
    }
    @objc func keyboardWillHide(sender: NSNotification) {
         self.view.frame.origin.y = 0 // Move view to original position
    }
    
    
    //    функция для очищения текстовых полей
    private func resetTextFields(){
        userNameTextField.text = ""
        passwordTextField.text = ""
    }
    
    //    функция для переключения между текст филдами с помощью клавиатуры
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switchBasedNextTextField(textField)
        return true
    }
    
    //    свичт кейс для переключения между текст филдами с помощью клавиатуры
    private func switchBasedNextTextField(_ textField: UITextField) {
        switch textField {
        case userNameTextField:
            passwordTextField.becomeFirstResponder()
        default:
            passwordTextField.resignFirstResponder()
            loginButtonPressedWithoutSender()
        }
    }
    
    //    скрываем клавиатуру тапом по экрану
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super .touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    @IBAction func forgotUserNameButtonPressed(_ sender: UIButton) {
        showAlert(title: "Your User Name is:", message: "User")
    }
    
    @IBAction func forgorPasswordButtonPressed(_ sender: UIButton) {
        showAlert(title: "Your Password is:", message: "Password")
    }
    
    //    функция которая выполняется при нажатии кнопки логин
    @IBAction func loginButtonPressedWithoutSender() {
        guard userNameTextField.text == "User" else {
            showAlert(title: "Wrong User Name or Password", message: "Please check your entries")
            resetTextFields()
            return
        }
        guard passwordTextField.text == "Password" else {
            showAlert(title: "Wrong User Name or Password", message: "Please check your entries")
            resetTextFields()
            return
        }
        //        то чего так не хватало что бы реализовать переход по кнопке done:
        performSegue(withIdentifier: "toWelcomeScreen", sender: UIButton.self)
    }
    
//    описание сегвея который происходит при нажатии на кнопку логин
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeViewController else { return }
        guard userNameTextField.text == "User" else { return }
        guard passwordTextField.text == "Password" else { return }
        welcomeVC.userGreetinLabel = userNameTextField.text
        resetTextFields()
    }
}

// экстеншн для алертов
extension LoginViewController {
    private func showAlert(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            self.passwordTextField.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
