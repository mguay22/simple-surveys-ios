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
    @IBOutlet var incorrectLoginLabel: UILabel!
    
    //Text Fields
    @IBOutlet var username : UITextField!
    @IBOutlet var password : UITextField!
    
    //Button Outlets
    @IBOutlet var loginButton : UIButton!
    @IBOutlet var registerButton : UIButton!
    
    //Buttons
    @IBAction func LoginRequest(_ sender: UIButton) {
        if (isValidLogin(u: username.text, p: password.text)) {
            loginButton.setTitle("Logged In", for: .normal)
            self.performSegue(withIdentifier: "SegueFromLoginToHome", sender: self)
            print("Hello")
        } else {
            incorrectLoginLabel.text = "Incorrect username and/or password"
        }
        
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
                
                print("Hello")
                
                return true
            }
            password.text = ""
            return false
        }
        password.text = ""
        return false
    }
}

