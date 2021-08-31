//
//  WelcomeViewController.swift
//  WorkWithSegue
//
//  Created by Глеб Mr on 25.08.2021.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var userInfoLabel: UILabel!
    
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userInfoLabel.text = "Welcome, \(user.person.fullName)!"
    }
}
