//
//  ViewController.swift
//  Simple Surveys
//
//  Created by Michael Guay on 2/24/20.
//  Copyright © 2020 Michael Guay. All rights reserved.
//

import UIKit

class HomeController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var answerTextField: UITextField!
    @IBOutlet var currentQuestion: UILabel!
    @IBOutlet var answerButtom: UIButton!
    @IBOutlet var currentSurvey: UILabel!
    
    var surveyRepo = SurveyRepository()
    var groupCode : String = ""
    var userID : String = ""
    
    
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
        //print(userRepo?.getGroupCode())
        
        surveyRepo.handleNewSurvey(groupCode: groupCode, userID: userID)
        
        //let question = surveyRepo.getQuestion()
        let question = surveyRepo.question
        
        currentQuestion.text = question
        if (currentQuestion.text == "Please check back later."){
            currentSurvey.text = "No Surveys Available"
            answerButtom.isHidden = true
            answerTextField.isHidden = true
        } else {
            currentSurvey.text = "Current Survey"
            answerButtom.isHidden = false
            answerTextField.isHidden = false
        }
        

    }
    
    @IBAction func submitSurvey(_ sender: UIButton) {
        
        if (surveyRepo.surveyID != "0" && answerTextField.text != "") {
            
            surveyRepo.postSurveyAnswer(response: answerTextField.text ?? "", userID: userID, surveyID: surveyRepo.surveyID ?? "0", groupCode: groupCode)
        
        currentSurvey.text = "No Surveys Available"
        currentQuestion.text = "Please check back later."
        answerTextField.text = ""
    }
    }
}

