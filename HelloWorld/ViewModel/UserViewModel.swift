//
//  UserViewModel.swift
//  HelloWorld
//
//  Created by Rebekah Baker on 7/12/18.
//  Copyright © 2018 Bekah Baker. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

struct UserViewModel {
    
    let name: String
    let imageURL: URL?
    let chatIconName: String
    
    // Dependency Injection
    init(user: User) {
        self.name = user.fullName().capitalized
        self.imageURL = URL(string: user.picture.medium)
        self.chatIconName = (SharedData.sharedInstance.user?.hasChatWith(user: user))! ? "messageIcon" : "arrowIcon"
    }
}
