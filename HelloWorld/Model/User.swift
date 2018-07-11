//
//  User.swift
//  HelloWorld
//
//  Created by Rebekah Baker on 5/10/18.
//  Copyright © 2018 Bekah Baker. All rights reserved.
//

import Foundation
import UIKit

//class User {
//
//    var id: Int!
//    var name: String!
//    var imageUrl: String!
//
//    init(id: Int, name: String, imageUrl: String) {
//        self.id = id
//        self.name = name
//        self.imageUrl = imageUrl
//    }
//
//    init(_ userData: [String: Any]) {
//        if let id = userData["id"] as? Int {
//            self.id = id
//        }
//        if let name = userData["name"] as? String {
//            self.name = name
//        }
//        if let imageUrl = userData["imageUrl"] as? String {
//            self.imageUrl = imageUrl
//        }
//    }
//
//}

struct Result: Codable {
    var users: [User]
    
    enum CodingKeys: String, CodingKey {
        case users = "results"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        users = try values.decode([User].self, forKey: .users)
    }
}

struct User: Codable {
    var name: Name
    var picture: Picture
}

struct Name: Codable {
    var first: String
    var last: String
}

struct Picture: Codable {
    var thumbnail: String
    var medium: String
    var large: String
}


extension User {
    func fullName() -> String {
        return "\(self.name.first) \(self.name.last)"
    }
    
    func encode() -> Data? {
        let encodedUser = try? JSONEncoder().encode(self)
        return encodedUser
    }
}






















