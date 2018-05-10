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
    
    var name: String
    var imageUrl: String
    
    init(_ name: String, _ imageUrl: String = "") {
        self.name = name
        self.imageUrl = imageUrl
    }
        
}
