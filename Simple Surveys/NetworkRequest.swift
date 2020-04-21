//
//  NetworkRequest.swift
//  Simple Surveys
//
//  Created by Matthew Blewett on 4/21/20.
//  Copyright © 2020 Michael Guay. All rights reserved.
//
import UIKit

class NetworkRequest {

    var question: String?
    var surveyID: String?
    
    func getQuestion() -> String{
        return question ?? "Please check back later."
    }
    
    func setSurveyID(data: String){
        question = data
    }
    
    func getSurveyID() -> String{
        return surveyID ?? "0"
    }
    
    
    func queryEndpoint(endpoint:String, body:NSMutableDictionary){
        
    let jsonData = try! JSONSerialization.data(withJSONObject: [body])


    let fullURL = "https://mguay.w3.uvm.edu/simple-surveys/wp-json/simplesurveys/v1/" + endpoint
        
    let url = URL(string: fullURL)!
    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.setValue("\(String(describing: jsonData.count))", forHTTPHeaderField: "Content-Length")
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    // insert json data to the request
    request.httpBody = jsonData

    let task = URLSession.shared.dataTask(with: request) { data, response, error in
        guard let data = data, error == nil else {
            print(error?.localizedDescription ?? "No data")
            return
        }
        
        let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
        if let responseJSON = responseJSON as? [[String: Any]] {
            
            if (endpoint == "post-text-survey/") {
                
                self.surveyID = "0"
                
            }
            
            if (responseJSON.count > 0) {
                if (endpoint == "get-text-survey/"){
                
                self.question = responseJSON[0]["question"] as? String
                self.surveyID = responseJSON[0]["id"] as? String
                
                }
            print(responseJSON)
            }
           
            
        }
    }
    
    task.resume()
    sleep(2)

    }

    
    
    
}

