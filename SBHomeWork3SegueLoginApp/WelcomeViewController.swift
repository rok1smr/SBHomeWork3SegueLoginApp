//
//  WelcomeViewController.swift
//  SBHomeWork3SegueLoginApp
//
//  Created by Konstantin on 26.10.2021.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    @IBOutlet weak var dynamicUserNameLabel: UILabel!
    
    var userGreetinLabel: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dynamicUserNameLabel.text = userGreetinLabel
    }
    
    @IBAction func logOutButtonPressed(_ sender: UIButton) {
//        dismiss(animated: true)  // dismiss is not needed anymore, unwindSegue is used to return to loginScreen
        performSegue(withIdentifier: "unwindToLogin", sender: self)
    }
}
