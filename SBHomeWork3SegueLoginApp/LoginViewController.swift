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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userNameTextField.delegate = self
        passwordTextField.delegate = self
        passwordTextField.returnKeyType = .done
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
        showAlert(title: "Your User Name is:", message: "U")
    }
    
    @IBAction func forgorPasswordButtonPressed(_ sender: UIButton) {
        showAlert(title: "Your Password is:", message: "P")
    }
    
    
    //    функция которая выполняется при нажатии кнопки логин
    @IBAction func loginButtonPressedWithoutSender() {
        guard userNameTextField.text == "U" else {
            showAlert(title: "Wrong User Name or Password", message: "Please check your entries")
            resetTextFields()
            return
        }
        guard passwordTextField.text == "P" else {
            showAlert(title: "Wrong User Name or Password", message: "Please check your entries")
            resetTextFields()
            return
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeViewController else { return }
        guard userNameTextField.text == "U" else { return }
        guard passwordTextField.text == "P" else { return }
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
