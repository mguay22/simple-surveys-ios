//
//  ViewController.swift
//  Simple Surveys
//
//  Created by Michael Guay on 2/24/20.
//  Copyright © 2020 Michael Guay. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    var userRepository = UserRepository()
    
    
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
    
    @IBAction func onDismissKeyboard(_ sender: Any) {
        username.resignFirstResponder()
        password.resignFirstResponder()
   }
    
    @IBAction func LoginRequest(_ sender: Any) {
        print("LoginRequest")
        if (isValidLogin(u: username.text, p: password.text)) {
           self.performSegue(withIdentifier: "SegueFromLoginToHome", sender: self)
       } else {
           incorrectLoginLabel.text = "Incorrect username and/or password"
           password.text = ""
       }
    }
    
    @IBAction func SignUpRequest(_ sender : UIButton) {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "SegueFromLoginToHome"?:
            let homeController = segue.destination as! HomeController
            print("Seg")
            print(userRepository.getGroupCode())
            homeController.groupCode = userRepository.getGroupCode()
            homeController.userID = userRepository.getUserID()
        default:
            return
        }
    }
    
    func isValidLogin(u : String?, p : String?) -> Bool {
        //Login request from server
        
        if (u != "" && u != nil) {
            //Check if username is is DB
            if (p != "" && p != nil) {
                //hash the password with correct function
                //Check if the hashed password matches the DB username
                userRepository.login(username: username.text!, password: password.text!)
                print(userRepository.getGroupCode())
                if (userRepository.getGroupCode() != "0"){
                return true
                } else {
                    return false
                }
            }
            password.text = ""
            return false
        }
        password.text = ""
        return false
    }
}

