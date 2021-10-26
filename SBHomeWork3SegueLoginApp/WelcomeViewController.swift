//
//  WelcomeViewController.swift
//  SBHomeWork3SegueLoginApp
//
//  Created by Konstantin on 26.10.2021.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    
    @IBOutlet weak var greetingLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    @IBAction func logOutButtonPressed(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
}
