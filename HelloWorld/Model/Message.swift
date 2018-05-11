//
//  Message.swift
//  HelloWorld
//
//  Created by Rebekah Baker on 5/10/18.
//  Copyright © 2018 Bekah Baker. All rights reserved.
//

import Foundation

class Message {
    
    var content: String!
    var timestamp: Date!
    var userId: Int!
    var conversationId: Int!
    
    init(content: String, timestamp: Date, userId: Int, conversationId: Int) {
        self.content = content
        self.timestamp = timestamp
        self.userId = userId
        self.conversationId = conversationId
    }
    
    init(_ messageData: [String: Any]) {
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
