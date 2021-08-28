//
//  LoginViewController.swift
//  WorkWithSegue
//
//  Created by Глеб Mr on 25.08.2021.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var loginTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    private let login = "admin"
    private let password = "12345"
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeViewController else { return }
        welcomeVC.userLogin = login
        
    }
    
    
    @IBAction func forgotUsernameBtn() {
        createAlert(title: "Your login 🤫", text: login)
    }
    
    @IBAction func forgotPasswordBtn() {
        createAlert(title: "Your password 🤫", text: password)
    }
    
    private func createAlert(title: String, text: String) {
        let alert = UIAlertController(
            title: title,
            message: text,
            preferredStyle: .alert
        )
        
        let okAction = UIAlertAction(title: "OK", style: .default)
        
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    @IBAction func loginPressedBtn() {
        if loginTF.text != login || passwordTF.text != password {
            createAlert(title: "❌❌❌❌❌", text: "login or password wrong")
            passwordTF.text = ""
        }
    }
    
    @IBAction func unwindSegueToLoginScreen(segue: UIStoryboardSegue) {
        loginTF.text = ""
        passwordTF.text = ""
    }

}

extension LoginViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == loginTF {
            passwordTF.becomeFirstResponder()
        } else {
            loginPressedBtn()
            performSegue(withIdentifier: "welcomeVC", sender: nil)
        }
        
        return true
    }
}
