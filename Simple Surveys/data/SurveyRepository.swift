//
//  SurveyRepository.swift
//  Simple Surveys
//
//  Created by Matthew Blewett on 3/3/20.
//  Copyright © 2020 Michael Guay. All rights reserved.
//

import Foundation


class SurveyRepository {
    
    var mDatabaseClient = DatabaseClient()
    var question: String?
    var surveyID: String?
    var groupCode: String?
    var userID: String?
    
    init(){
        
        //let constant : Constants = Constants()
        //var mDatabaseClient : DatabaseClient = DatabaseClient(url : Constants.API_URL)
        //mDatabaseClient.api_url = constant.API_URL
        
    }
    
    func handleNewSurvey(groupCode : String, userID : String) {
                
        let body1:NSMutableDictionary = NSMutableDictionary()
        body1.setValue(groupCode, forKey: "group_code")
        body1.setValue(userID, forKey: "user_id")
        
        mDatabaseClient.queryEndpoint(endpoint: "get-text-survey/", body: body1)
        
        self.question = mDatabaseClient.question
        self.surveyID = mDatabaseClient.surveyID
        //self.surveyID = "25"
        
    }
    
    
    func postSurveyAnswer(response : String, userID : String, surveyID : String, groupCode : String) {
        
        let body1:NSMutableDictionary = NSMutableDictionary()
        body1.setValue(userID, forKey: "user_id")
        body1.setValue(response, forKey: "response")
        body1.setValue(surveyID, forKey: "survey_id")
        body1.setValue(groupCode, forKey: "group_code")
        
        mDatabaseClient.queryEndpoint(endpoint: "post-text-survey", body: body1)
        
        
    }
    
    func getQuestion() -> String {
        return question ?? "Please check back later."
    }
    
    func getSurveyID() -> String{
        return surveyID ?? "0"
    }
    
}
