//
//  APIEndpoint.swift
//  HelloWorld
//
//  Created by Rebekah Baker on 7/9/18.
//  Copyright © 2018 Bekah Baker. All rights reserved.
//

import Foundation

/*
 Build protocol for an endpoint:
    BaseURL is the base
    Path is the specific path of endpoint
    FullUrl combines base and path
    Method is HTTPRequest Method ie. GET, PUT, DELETE
*/

protocol APIEndpoint {
    var baseURL: String { get }
    var path: String { get }
    var fullURL: String { get }
    var method: String { get }
    // add method/parameters/encoding/headers

}

extension APIEndpoint {
    
    var baseURL: String {
        return "https://randomuser.me/api/"
    }
    
    var fullURL: String {
        return baseURL + path
    }
}

enum UserEndpoints {
    case getUsers(countOf: Int)
    case loginWithFacebook
    // Could add additional user endpoints (login, get specific user, etc)
}

extension UserEndpoints: APIEndpoint {

    var path: String {
        switch self {
        case .getUsers(let countOf):
            return "?results=\(countOf)"
        case .loginWithFacebook:
            return "facebook"
        }
    }
    
    var method: String {
        switch self {
        case .getUsers:
            return "GET"
        case .loginWithFacebook:
            return "POST"
        }
    }
}

enum ConversationEndpoints {
    case getAllConversations
    case postNewMessage
}

extension ConversationEndpoints: APIEndpoint {
    var path: String {
        switch self {
        case .getAllConversations:
            return "conversations"
        case .postNewMessage:
            return "newMessage"
        }
    }
    
    var method: String {
        switch self {
        case .getAllConversations:
            return "GET"
        case .postNewMessage:
            return "POST"
        }
    }
}
