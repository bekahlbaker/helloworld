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
    let hasConversationWIith: Bool
    
    // Dependency Injection
    init(user: User) {
        self.name = user.fullName().capitalized
        self.imageURL = URL(string: user.picture.medium)
        if let currentUser = SharedData.sharedInstance.user {
            self.chatIconName = currentUser.hasChatWith(user: user) ? "messageIcon" : "arrowIcon"
            self.hasConversationWIith = currentUser.hasChatWith(user: user) ? true : false
        } else {
            self.chatIconName = "arrowIcon"
            self.hasConversationWIith = false
        }
    }
}
