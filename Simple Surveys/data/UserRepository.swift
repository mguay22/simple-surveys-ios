//
//  UserRepository.swift
//  Simple Surveys
//
//  Created by Matthew Blewett on 3/3/20.
//  Copyright © 2020 Michael Guay. All rights reserved.
//

import Foundation


class UserRepository {
    
    var mDatabaseClient : DatabaseClient?
    var mLoginResult : Result?
    var mRegisterResult : Result?
    
    
     init(){
        
        let constant : Constants = Constants()
        mDatabaseClient = DatabaseClient(url: constant.API_URL)
        
    }
    
    
    func login (username : String, password : String) {
        print("login")
        
        let body1:NSMutableDictionary = NSMutableDictionary()
        body1.setValue(username, forKey: "username")
        body1.setValue(password, forKey: "password")
        
        mDatabaseClient?.queryEndpoint(endpoint: "get-user", body: body1)
        
    }
    
    
    func setLoginResult(loginResult : Result){
        mLoginResult = loginResult
    }
    
    func getLoginResult() -> Result {
        return mLoginResult!
    }
    
    func setRegisterResult(registerResult : Result){
        mRegisterResult = registerResult
    }
    
    func getRegisterResult() -> Result {
        return mRegisterResult!
    }
    
    
    func register(username : String, password : String, name : String, groupCode : String) {
        
        let body1:NSMutableDictionary = NSMutableDictionary()
        body1.setValue(username, forKey: "username")
        body1.setValue(password, forKey: "password")
        body1.setValue(name, forKey: "name")
        body1.setValue(groupCode, forKey: "group_code")
        
        mDatabaseClient?.queryEndpoint(endpoint: "post-user", body: body1)
        
    }
    
}
