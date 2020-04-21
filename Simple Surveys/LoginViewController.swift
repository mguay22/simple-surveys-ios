//
//  ViewController.swift
//  Simple Surveys
//
//  Created by Michael Guay on 2/24/20.
//  Copyright © 2020 Michael Guay. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    var userRepository : UserRepository?
    
    
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
    
    //Button Outlets
    @IBOutlet var loginButton : UIButton!
    @IBAction func login(_ sender: UIButton) {
        print("Click")
        userRepository = UserRepository()
         userRepository?.login(username: username.text!, password: password.text!)
    }
    @IBOutlet var registerButton : UIButton!
        
    //Buttons
    @IBAction func LoginRequest(_ sender: UIButton) {
//        if (isValidLogin(u: username.text, p: password.text)) {
//            loginButton.setTitle("Logged In", for: .normal)
//        }
       
        
    }
    @IBAction func SignUpRequest(_ sender : UIButton) {
        
    }
    
    func isValidLogin(u : String?, p : String?) -> Bool {
        //Login request from server
        
        if (u != "" && u != nil) {
            //Check if username is is DB
            if (p != "" && p != nil) {
                //hash the password with correct function
                //Check if the hashed password matches the DB username
                return true
            }
            return false
        }
        return false
    }
}

