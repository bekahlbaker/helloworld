//
//  User.swift
//  HelloWorld
//
//  Created by Rebekah Baker on 5/10/18.
//  Copyright © 2018 Bekah Baker. All rights reserved.
//

import Foundation
import UIKit

class User {
    
    var id: Int!
    var name: String!
    var imageUrl: String!
    
    init(id: Int, name: String, imageUrl: String) {
        self.id = id
        self.name = name
        self.imageUrl = imageUrl
    }
    
    init(_ userData: [String: Any]) {
        if let id = userData["id"] as? Int {
            self.id = id
        }
        if let name = userData["name"] as? String {
            self.name = name
        }
        if let imageUrl = userData["imageUrl"] as? String {
            self.imageUrl = imageUrl
        }
    }
        
}
