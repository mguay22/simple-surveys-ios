//
//  ViewController.swift
//  Simple Surveys
//
//  Created by Michael Guay on 2/24/20.
//  Copyright © 2020 Michael Guay. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //Labels
    @IBOutlet var usernameLabel : UILabel!
    @IBOutlet var passwordLabel : UILabel!
    
    //Text Fields
    @IBOutlet var username : UITextField!
    @IBOutlet var password : UITextField!
    
    //Buttons
    @IBAction func LoginRequest(_ sender: UIButton) {
        
    }
    @IBAction func SignUpRequest(_ sender : UIButton) {
        
    }
}

