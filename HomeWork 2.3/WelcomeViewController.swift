//
//  WelcomeViewController.swift
//  HomeWork 2.3
//
//  Created by Светлана Романенко on 03.02.2021.
//

import UIKit

class WelcomeViewController: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet var userNameLabel: UILabel!
    
    //MARK: - Public properties
    var userName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userNameLabel.text = "Welcome, \(userName)!"
    }
}
