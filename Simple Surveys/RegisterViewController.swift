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
    @IBOutlet var usernameLabel : UILabel!
    @IBOutlet var emailLabel : UILabel!
    @IBOutlet var passwordLabel : UILabel!
    
    //Text Fields
    @IBOutlet var usernameField : UITextField!
    @IBOutlet var emailField : UITextField!
    @IBOutlet var passwordField : UITextField!
    
    //Button Outlets
    @IBOutlet var signUpButton : UIButton!
    @IBOutlet var toLoginButton : UIButton!
    
    @IBAction func toLogin(_ sender : Any) {
        
    }
    
    
    
    
    @IBAction func signUpRequest(_ sender: Any) {
        if(signUpValid(u : usernameField.text, e : emailField.text, p: passwordField.text)) {
            //Sign user up
            //Send email verification
            signUpButton.setTitle("Signed Up", for: .normal)
        }
    }
    
    func signUpValid(u : String?, e : String?, p : String?) -> Bool {
        if (u != "" && u != nil) {
            //Check if username is offensive
            if (e != "" && e != nil) {
                //Check is email is vaild
                if (p != "" && p != nil) {
                    //Hash password
                    //Request signup to DB from server
                    return true
                }
                //Password failed
                return false
            }
            //Email failed
            return false
        }
        //Username failed
        return false
    }
    
}
