//
//  Login.swift
//  HelloWorld
//
//  Created by Rebekah Baker on 5/11/18.
//  Copyright © 2018 Bekah Baker. All rights reserved.
//

import Foundation

class Login {
    
//    // MARK: - Properties
//
//    static let sharedInstance = Login(baseURL: URL(string: "http://someurl")!)
//
//    // MARK: -
//
//    let baseURL: URL
//
//    // Initialization
//
//    private init(baseURL: URL) {
//        self.baseURL = baseURL
//    }
    
    static func withFacebook(completion: (User) -> ()) {
        // Make call to login on facebook
        // On success, return a user
        // On failure, return an error
        let loginSuccessful = true
        let json = [
            "id": 2,
            "name": "Sam Baker",
            "imageUrl": "https://cdn.gratisography.com/photos/447H.jpg"
            ] as [String : Any]
        let newUser = User(json)
        
        if loginSuccessful {
            completion(newUser)
        }
    }
    
    
//    static func getBoolValue(number : Int, completion: (Bool)->()) {
//        if number > 5 {
//            completion(true)
//        } else {
//            completion(false)
//        }
//    }
    
}
