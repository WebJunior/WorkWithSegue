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
    
    private let user = User.getUserData()
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let tabBarController = segue.destination as? UITabBarController else { return }
        guard let viewControllers = tabBarController.viewControllers else { return }
        
        for viewController in viewControllers {
            if let welcomeVC = viewController as? WelcomeViewController {
                welcomeVC.user = user
            } else if let navigationVC = viewController as? UINavigationController {
                let userInfoVC = navigationVC.topViewController as! UserInfoViewController
                userInfoVC.user = user
            }
        }
        
        
    }
    
    
    @IBAction func forgotUsernameBtn() {
        createAlert(title: "Your login 🤫", text: user.login)
    }
    
    @IBAction func forgotPasswordBtn() {
        createAlert(title: "Your password 🤫", text: user.password)
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
        if loginTF.text != user.login || passwordTF.text != user.password {
            createAlert(title: "❌❌❌❌❌", text: "Login or password wrong")
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
