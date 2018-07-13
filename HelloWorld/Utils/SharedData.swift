//
//  SharedData.swift
//  HelloWorld
//
//  Created by Rebekah Baker on 7/12/18.
//  Copyright © 2018 Bekah Baker. All rights reserved.
//

import Foundation

class SharedData {
    
    // so you can't init from anywhere else
    private init() {}
    
    static let sharedInstance = SharedData()
    var user: User? {
        didSet {
            print("Shared instance user", user)
        }
    }
    
//    private func saveUserToServer() {
//        guard let user = user else { return }
//        NetworkingManager.request(endpoint: APIEndpoint.updateProfile(user: user)) { (response: Result<User, NetworkingError>) in
//            switch response {
//            case .success(_ ):
//                print("SUCCESSFULLY SAVED USER TO SERVER ")
//                break
//            case .failure(let error):
//                // TODO: HANDLE FAILURE
//                print("Failed to save user to server: \(error.localizedDescription)")
//            }
//        }
//    }
}
