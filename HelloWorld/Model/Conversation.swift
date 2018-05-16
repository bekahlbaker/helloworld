//
//  Conversation.swift
//  HelloWorld
//
//  Created by Rebekah Baker on 5/11/18.
//  Copyright © 2018 Bekah Baker. All rights reserved.
//

import Foundation

class Conversation {
    var id: Int!
    var messages: [Message]!
    var users: [User]!
    
    init(_ messages: [Message], users: [User], id: Int) {
        self.id = id
        self.messages = messages
        self.users = users
    }
    
    init(_ conversationData: [String : [[String : Any]]]) {
        if let conversations = conversationData["conversations"] {
            for convo in conversations {
                self.id = convo["id"] as? Int
                
                if let convMessages = convo["messages"] as? [[String: Any]] {
                    var mutableMsgs = [Message]()
                    for msg in convMessages {
                        let newMsg = Message(msg)
                        mutableMsgs.append(newMsg)
                    }
                    self.messages = mutableMsgs
                }
                
                if let convUsers = convo["users"] as? [[String: Any]] {
                    var mutableUsers = [User]()
                    for us in convUsers {
                        let newUser = User(us)
                        mutableUsers.append(newUser)
                    }
                    self.users = mutableUsers
                }
            }
        }
    }
}
