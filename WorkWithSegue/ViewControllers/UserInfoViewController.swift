//
//  UseInfoViewController.swift
//  WorkWithSegue
//
//  Created by Глеб Mr on 31.08.2021.
//

import UIKit

class UserInfoViewController: UIViewController {
    
    @IBOutlet weak var userInfoLabel: UILabel!
    
    var user: User!
    
    override func viewDidLoad() {
        let hobbies = user.person.hobbies.joined(separator: ",")
        userInfoLabel.text = "Description: \(user.person.description). Hobbies \(hobbies)"
    }
}
