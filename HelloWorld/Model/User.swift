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

struct User {
    
    let id: Int
    let name: String
    let imageUrl: String
}

extension User: Decodable {
    enum MyStructKeys: String, CodingKey {
        case id
        case name
        case imageUrl
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: MyStructKeys.self)
        let id = try container.decode(Int.self, forKey: .id)
        let name = try container.decode(String.self, forKey: .name)
        let imageUrl = try container.decode(String.self, forKey: .imageUrl)
        
        self.init(id: id, name: name, imageUrl: imageUrl)
    }
}
