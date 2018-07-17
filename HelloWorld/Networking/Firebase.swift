//
//  Firebase.swift
//  HelloWorld
//
//  Created by Rebekah Baker on 7/16/18.
//  Copyright © 2018 Bekah Baker. All rights reserved.
//

import Foundation
import Firebase

class Firebase {
    
    static func loginAnonymously() {
        Auth.auth().signInAnonymously(completion: { (result, error) in
            if let err = error {
                print(err.localizedDescription)
                return
            }
            
            let user = result?.user
            let id = user?.uid
            print("User", id)
        })
    }
}
