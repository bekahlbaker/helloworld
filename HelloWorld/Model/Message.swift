//
//  Message.swift
//  HelloWorld
//
//  Created by Rebekah Baker on 5/10/18.
//  Copyright © 2018 Bekah Baker. All rights reserved.
//

import Foundation

class Message {
    
    var content: String
    var timestamp: String
    var user = User()
    
    init(_ content: String, _ timestamp: String) {
        self.content = content
        self.timestamp = timestamp
    }
    
    func getUser(_ byId: Int) -> User {
        // Set up call to retreive user by Id
        switch byId {
        case 1:
            let user1 = User("John Doe", "https://cdn.gratisography.com/photos/442H.jpg")
            self.user = user1
            return user1
        case 2:
            let user2 = User("Jane Doe", "https://cdn.gratisography.com/photos/437H.jpg")
            self.user = user2
            return user2
        default:
            return User("", "")
        }
    }
    
}
