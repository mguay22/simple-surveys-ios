//
//  DatabaseClient.swift
//  Simple Surveys
//
//  Created by Matthew Blewett on 3/3/20.
//  Copyright © 2020 Michael Guay. All rights reserved.
//

import Foundation

class DatabaseClient {
    
    var api_url : String?
    var question: String?
    var surveyID: String?
    var groupCode: String?
    var name: String?
    var userID: String?
    
    init(){
        self.api_url = "http://mguay.w3.uvm.edu/simple-surveys/wp-json/simplesurveys/v1/"
    }
    
    func getQuestion() -> String {
        return question ?? "Please check back later."
    }
    
    func getSurveyID() -> String{
        return surveyID ?? "0"
    }
    
    func getGroupCode() -> String {
        return groupCode ?? "0"
    }
    
    func getName() -> String{
        return name ?? "Stan Smith"
    }
    
    func getUserID() -> String{
        return userID ?? "0"
    }
    
    func queryEndpoint(endpoint:String, body:NSMutableDictionary){
        print("query")
        
    let jsonData = try! JSONSerialization.data(withJSONObject: [body])
        print(body)


    let fullURL = api_url! + endpoint
        print(fullURL)
        
    let url = URL(string: fullURL)!
    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.setValue("\(String(describing: jsonData.count))", forHTTPHeaderField: "Content-Length")
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    // insert json data to the request
    request.httpBody = jsonData
        print(jsonData)
    let task = URLSession.shared.dataTask(with: request) { data, response, error in
        print("data")
        guard let data = data, error == nil else {
            print(error?.localizedDescription ?? "No data")
            return
        }
        let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
        if let responseJSON = responseJSON {
            print("res")
            print(responseJSON)
            
            guard let jsonArray = responseJSON as? [[String: Any]] else {
                return
            }

            
            if (endpoint == "post-text-survey/") {
                
                self.surveyID = "0"
                
            }
            
            if (jsonArray.count > 0) {
                if (endpoint == "get-text-survey/"){
                
                self.question = jsonArray[0]["question"] as? String
                self.surveyID = jsonArray[0]["id"] as? String
                
                } else if (endpoint == "get-user") {
                    
                self.groupCode = jsonArray[0]["group_code"] as? String
                self.name = jsonArray[0]["name"] as? String
                self.userID = jsonArray[0]["uid"] as? String
                    
                }
            }
                
//            print(responseJSON[0]["question"] ?? "There are no new surveys available at this time")
            //Code after Successfull POST Request
            
        
    }
        }

    task.resume()
    sleep(2)

    }

    
    
    
}
