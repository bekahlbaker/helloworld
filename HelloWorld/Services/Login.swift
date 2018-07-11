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

        APIRequest.makeRequestTo(endpoint: UserEndpoints.getUsers(countOf: 1)) { (data, error) in
            if data != nil {
                guard let dataReponse = data else { return }
                
                guard let newUser = try? JSONDecoder().decode(User.self, from: dataReponse) else { return }
                
                print("NEW USER ", newUser)
                
            } else {
                print("NOPE", error ?? "")
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
