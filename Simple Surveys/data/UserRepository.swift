//
//  UserRepository.swift
//  Simple Surveys
//
//  Created by Matthew Blewett on 3/3/20.
//  Copyright © 2020 Michael Guay. All rights reserved.
//

import Foundation


class UserRepository {
    
    var mDatabaseClient = DatabaseClient()
    var mLoginResult : Result?
    var mRegisterResult : Result?
    
    var name: String?
    var groupCode: String?
    var userID: String?
    
    
     init(){
        
    }
    
    
    func login (username : String, password : String) {
        print("login")
        
        let body1:NSMutableDictionary = NSMutableDictionary()
        body1.setValue(username, forKey: "username")
        body1.setValue(password, forKey: "password")
        
        mDatabaseClient.queryEndpoint(endpoint: "get-user", body: body1)
        
        self.name = mDatabaseClient.name
        self.groupCode = mDatabaseClient.groupCode
        self.userID = mDatabaseClient.userID
        
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
    
    
    func register(username : String, password : String, email : String, groupCode : String) {
        
        let body1:NSMutableDictionary = NSMutableDictionary()
        body1.setValue(username, forKey: "username")
        body1.setValue(password, forKey: "password")
        body1.setValue(email, forKey: "name")
        body1.setValue(groupCode, forKey: "group_code")
        
        mDatabaseClient.queryEndpoint(endpoint: "post-user", body: body1)
        
        self.name = username
        self.groupCode = groupCode
        
        
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
    
}
