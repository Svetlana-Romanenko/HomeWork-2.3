//
//  ViewController.swift
//  HomeWork 2.3
//
//  Created by Светлана Романенко on 02.02.2021.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet var userNameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeViewController = segue.destination as? WelcomeViewController else { return }
        welcomeViewController.userName =  userNameTextField.text
    }
    
    @IBAction func unwindSegue(segue: UIStoryboardSegue) {
        userNameTextField.text = nil
        passwordTextField.text = nil
    }
    
    @IBAction func logInButtonPressed() {
        guard userNameTextField.text == "User",
              passwordTextField.text == "Password" else {
            showAlert(with: "Invalid login or password", message: "Please, enter correct login and password")
            return
        }
    }
    
    @IBAction func forgotUserNameButtonPressed() {
        showAlert(with: "Oops!", message: "Your name is User")
    }
    @IBAction func forgotPasswordButtonPressed() {
        showAlert(with: "Oops!", message: "Your password is Password")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

// MARK: - Alert Controller

extension LoginViewController {
    private func showAlert(with title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            self.passwordTextField.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
