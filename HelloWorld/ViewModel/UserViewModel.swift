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
<<<<<<< HEAD
=======
    let hasConversationWith: Bool
    let chatViewAlpha: CGFloat
    let startConvoAlpha: CGFloat
    let beginConversationWithUser: String
>>>>>>> peopleCell
    
    // Dependency Injection
    init(user: User) {
        self.name = user.fullName().capitalized
        self.imageURL = URL(string: user.picture.medium)
<<<<<<< HEAD
        self.chatIconName = (SharedData.sharedInstance.user?.hasChatWith(user: user))! ? "messageIcon" : "arrowIcon"
=======
        if let currentUser = SharedData.sharedInstance.user {
            self.chatIconName = currentUser.hasChatWith(user: user) ? "messageIcon" : "arrowIcon"
            self.hasConversationWith = currentUser.hasChatWith(user: user) ? true : false
        } else {
            self.chatIconName = "arrowIcon"
            self.hasConversationWith = false
        }
        self.startConvoAlpha = self.hasConversationWith ? 0 : 1
        self.chatViewAlpha = self.hasConversationWith ? 1 : 0
        self.beginConversationWithUser = "Begin conversation with \(self.name)"
>>>>>>> peopleCell
    }
}
