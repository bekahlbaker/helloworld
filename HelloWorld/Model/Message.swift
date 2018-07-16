//
//  Message.swift
//  HelloWorld
//
//  Created by Rebekah Baker on 5/10/18.
//  Copyright © 2018 Bekah Baker. All rights reserved.
//

import Foundation

class Message {
    var id: Int!
    var content: String!
    var timestamp: Date!
    var userId: Int!
    var conversationId: Int!
    
    init(content: String, timestamp: Date, userId: Int, conversationId: Int, id: Int) {
        self.id = id
        self.content = content
        self.timestamp = timestamp
        self.userId = userId
        self.conversationId = conversationId
    }
    
    init(_ messageData: [String: Any]) {
        if let id = messageData["id"] as? Int {
            self.id = id
        }
        if let content = messageData["content"] as? String {
            self.content = content
        }
        if let timestamp = messageData["timestamp"] as? Date {
            self.timestamp = timestamp
        }
        if let userId = messageData["userId"] as? Int {
            self.userId = userId
        }
        if let conversationId = messageData["conversationId"] as? Int {
            self.conversationId = conversationId
        }
    }
}
