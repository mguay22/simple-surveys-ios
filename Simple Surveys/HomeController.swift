//
//  ViewController.swift
//  Simple Surveys
//
//  Created by Michael Guay on 2/24/20.
//  Copyright © 2020 Michael Guay. All rights reserved.
//

import UIKit

class HomeController: UIViewController {
    
    @IBOutlet var answerTextField: UITextField!
    @IBOutlet var currentQuestion: UILabel!
    @IBOutlet var answerButtom: UIButton!
    var groupCode: String = ""
    
    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        answerTextField.resignFirstResponder()
    }
    
    override func viewDidLoad() {
        // Call handleNewSurvey
    }
    
    func handleNewSurvey(_ notification: Any) {
        print(notification)
        // Send POST request to backend to get new survey
        // Update currentQuestion and the submit button
    }
}

