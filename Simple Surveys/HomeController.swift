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
    @IBOutlet var currentSurvey: UILabel!
    
    var groupCode: String = "13"
    var userID: String = "4"
    let aNetworkRequest = NetworkRequest()
    
    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        answerTextField.resignFirstResponder()
    }
    
    override func viewDidLoad() {
        // Call handleNewSurvey
        handleNewSurvey("New Survey")
    }
    
    func handleNewSurvey(_ notification: Any) {
        print(notification)
        // Send POST request to backend to get new survey
        // Update currentQuestion and the submit button
        
        
        let body:NSMutableDictionary = NSMutableDictionary()
        
        body.setValue(self.groupCode, forKey: "group_code")
        body.setValue(self.userID, forKey: "user_id")

        let end = "get-text-survey/"
        
        aNetworkRequest.queryEndpoint(endpoint: end, body: body)
        
        let question = aNetworkRequest.getQuestion()
        
        currentQuestion.text = question
        if (currentQuestion.text == "Please check back later."){
            currentSurvey.text = "No Surveys Available"
        } else {
            currentSurvey.text = "Current Survey"
        }
        
        
    }
    
    @IBAction func submitSurvey(_ sender: UIButton) {
        
        if (Int(aNetworkRequest.getSurveyID()) != 0) {
        
        let body:NSMutableDictionary = NSMutableDictionary()
        
        body.setValue(self.groupCode, forKey: "user_id")
        body.setValue(answerTextField.text, forKey: "response")
        body.setValue(aNetworkRequest.getSurveyID(), forKey: "survey_id")
        body.setValue(self.userID, forKey: "group_code")

        let end = "post-text-survey/"
        
        aNetworkRequest.queryEndpoint(endpoint: end, body: body)
        
        currentSurvey.text = "No Surveys Available"
        currentQuestion.text = "Please check back later."
        answerTextField.text = ""
    }
    }
    
}

