//
//  ViewController.swift
//  HomeWork 2.3
//
//  Created by Светлана Романенко on 02.02.2021.
//

import UIKit

class LoginViewController: UIViewController {
    
// MARK: - IBOutlets
    @IBOutlet var userNameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
// MARK: - Private properties
    private let user = "User"
    private let password = "Password"
    
// MARK: - Override Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userNameTextField.delegate = self
        userNameTextField.returnKeyType = .next
        
        passwordTextField.delegate = self
        passwordTextField.returnKeyType = .go
    }
    
// MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let welcomeViewController = segue.destination as! WelcomeViewController
        welcomeViewController.userName =  user
    }
    
// MARK: - IBActions
    @IBAction func unwindSegue(segue: UIStoryboardSegue) {
        userNameTextField.text = nil
        passwordTextField.text = nil
    }
    
    @IBAction func logInButtonPressed() {
        guard userNameTextField.text == user,
              passwordTextField.text == password else {
            showAlert(
                with: "Invalid login or password",
                message: "Please, enter correct login and password",
                textField: passwordTextField
            )
            return
        }
        performSegue(withIdentifier: "showWelcomeViewController", sender: nil)
    }
    
    @IBAction func forgotUserNameButtonPressed() {
        showAlert(with: "Oops!",
                  message: "Your name is \(user)")
    }
    @IBAction func forgotPasswordButtonPressed() {
        showAlert(with: "Oops!",
                  message: "Your password is \(password)")
    }
}

// MARK: - Alert Controller
extension LoginViewController {
    private func showAlert(with title: String, message: String, textField: UITextField? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            textField?.text = nil
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

// MARK: - Work with keyboard
extension LoginViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super .touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userNameTextField {
            passwordTextField.becomeFirstResponder()
        } else {
            logInButtonPressed()
        }
        return true
    }
}
