//
//  API.swift
//  HelloWorld
//
//  Created by Rebekah Baker on 5/11/18.
//  Copyright © 2018 Bekah Baker. All rights reserved.
//

import Foundation

class API {
    
    static func getConversations(_ data: [String: Any]) -> [Conversation] {
        var arr = [Conversation]()
        if let convArray = data["conversation"] as? [String: Any] {
            for c in convArray {
                print("Conversation", c)
                if let messages = c["messages"] as? [String: Any], let users = c["users"] as? [String: Any] {
                    let newConv = Conversation(messages, users)
                }
            }
        }
        return arr
    }
}