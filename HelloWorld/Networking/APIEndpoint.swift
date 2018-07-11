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
    Model is the model you expect to be returned from the API at that endpoint
    Path is the specific path of endpoint
    FullUrl combines base and path
    Method is HTTPRequest Method ie. GET, PUT, DELETE
    makeModel accepts data returned from API and converts to specified model
*/

protocol APIEndpoint {
//    associatedtype Model
    var path: String { get }
    var fullURL: String { get }
    var method: String { get }
    // add method/parameters/encoding/headers
    
    func makeModel(data: Data) -> AnyObject?
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
    // Could add additional user endpoints (login, get specific user, etc)
}

extension UserEndpoints: APIEndpoint {
    func makeModel(data: Data) -> AnyObject? {
        guard let result = try? JSONDecoder().decode(User.self, from: data) else {
            return nil
        }
        
        return result as AnyObject
    }
    
    
//    typealias Model = User
    
//    func makeModel(data: Data) -> User? {
//        guard let result = try? JSONDecoder().decode(User.self, from: data) else {
//            return nil
//        }
//
//        return result
//    }
    
    var path: String {
        switch self {
        case .getUsers(let countOf):
            return "?results=\(countOf)"
        }
    }
    
    var method: String {
        switch self {
        case .getUsers:
            return "GET"
        }
    }
}
