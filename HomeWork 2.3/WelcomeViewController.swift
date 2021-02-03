//
//  WelcomeViewController.swift
//  HomeWork 2.3
//
//  Created by Светлана Романенко on 03.02.2021.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    @IBOutlet var userNameLabel: UILabel!
    
    var userName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let userName = self.userName else { return }
        userNameLabel.text = "Welcome, \(userName)!"
    }
}
