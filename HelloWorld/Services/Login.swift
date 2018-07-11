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
//        let loginSuccessful = true
        let json = """
        {
            "id": 1,
            "name": "Sam McCrackin",
            "imageUrl": "https://cdn.gratisography.com/photos/447H.jpg"
        }
        """.data(using: .utf8)!
//        do {
//            let newUser = try JSONDecoder().decode(User.self, from: json)
//            print("NEW USER ", newUser)
//            completion(newUser)
//        } catch {
//            print(error)
//        }
        
//        if loginSuccessful {
//            if let user = newUser {
//             completion(user)
//            }
//        }
        
        APIRequest.makeRequestTo(endpoint: UserEndpoints.getUsers(countOf: 10)) { (response) in
            if response != nil {
                print(response)
            } else {
                print("NOPE")
            }
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
