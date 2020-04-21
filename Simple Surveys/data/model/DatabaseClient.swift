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
    
    
    init(url : String){
        api_url = url
    }
    
    
    func queryEndpoint(endpoint:String, body:NSMutableDictionary){
        print("query")
        
    let jsonData = try! JSONSerialization.data(withJSONObject: [body])
        print(body)


    let fullURL = api_url! + endpoint
        
    let url = URL(string: fullURL)!
    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.setValue("\(String(describing: jsonData.count))", forHTTPHeaderField: "Content-Length")
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    // insert json data to the request
    request.httpBody = jsonData
        print(jsonData)
    let task = URLSession.shared.dataTask(with: request) { data, response, error in
        print("Sus")
        print(data)
        guard let data = data, error == nil else {
            print("Sus")
            print(error?.localizedDescription ?? "No data")
            return
        }
        let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
        if let responseJSON = responseJSON {
            print("Hi")
            print(responseJSON)
//            print(responseJSON[0]["question"] ?? "There are no new surveys available at this time")
            //Code after Successfull POST Request
            
        }
    }

    task.resume()

    }

    
    
    
}
