//
//  Conversation.swift
//  HelloWorld
//
//  Created by Rebekah Baker on 5/11/18.
//  Copyright © 2018 Bekah Baker. All rights reserved.
//

import Foundation

class Conversation {
    var messages: [Message]!
    var users: [User]!
    
    init(_ messages: [Message], users: [User]) {
        self.messages = messages
        self.users = users
    }
    
//    init(_ conversationData: [String: Any]) {
//        if let messages = conversationData["messages"] as? [[String: Any]] {
//            var msgArray = [Message]()
//            for message in messages {
//                let newMessage = Message(message)
//                msgArray.append(newMessage)
//            }
//            self.messages = msgArray
//        }
//        if let users = conversationData["users"] as? [[String: Any]] {
//            var userArray = [User]()
//            for user in users {
//                let newUser = User(user)
//                userArray.append(newUser)
//            }
//            self.users = userArray
//        }
//    }
}
