//
//  MessageViewModel.swift
//  HelloWorld
//
//  Created by Rebekah Baker on 7/13/18.
//  Copyright © 2018 Bekah Baker. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

struct MessageViewModel {
//
//    let name: String
    let message: String
    let messageIsFromCurrentUser: Bool
    let leadingConstant: CGFloat
    let trailingConstant: CGFloat
    let textAlignment: NSTextAlignment
    let backgroundColor: UIColor
    
    // Dependency Injection
    init(message: Message) {
        self.message = message.content
        self.messageIsFromCurrentUser = SharedData.sharedInstance.user?.id == message.id
        self.leadingConstant = self.messageIsFromCurrentUser ? 175 : 16
        self.trailingConstant = self.messageIsFromCurrentUser ? 16 : 175
        self.textAlignment = self.messageIsFromCurrentUser ? .right : .left
        self.backgroundColor = self.messageIsFromCurrentUser ? UIColor(red:0.13, green:0.82, blue:0.67, alpha: 0.5) : UIColor(red:0.81, green:0.81, blue:0.81, alpha: 0.5)
    }
}
