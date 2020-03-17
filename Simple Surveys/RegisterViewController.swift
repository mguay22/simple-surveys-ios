//
//  RegisterViewController.swift
//  Simple Surveys
//
//  Created by Eric Langdon on 3/3/20.
//  Copyright © 2020 Michael Guay. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //Labels
    @IBOutlet var usernameLabel: UILabel!
    @IBOutlet var emailLabel: UILabel!
    @IBOutlet var passwordLabel: UILabel!
    
    //Text Fields
    @IBOutlet var usernameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    
    
    @IBAction func signUpRequest(_ sender: Any) {
    }
    
}
