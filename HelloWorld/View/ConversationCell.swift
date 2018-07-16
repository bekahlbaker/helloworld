//
//  ConversationCell.swift
//  HelloWorld
//
//  Created by Rebekah Baker on 5/11/18.
//  Copyright © 2018 Bekah Baker. All rights reserved.
//

import UIKit
import Kingfisher

class ConversationCell: UITableViewCell {
    
    @IBOutlet weak var avatar: AvatarImageView!
    @IBOutlet weak var body: UILabel!
    @IBOutlet weak var timestamp: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        // initially set the format based on your datepicker date / server String
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        let myString = formatter.string(from: Date()) // string purpose I add here
        // convert your string to date
        let yourDate = formatter.date(from: myString)
        //then again set the date format whhich type of output you need
        formatter.dateFormat = "MMM dd yyyy"
        // again convert your date to string
        let myStringafd = formatter.string(from: yourDate!)
        
        print(myStringafd)
        return myStringafd
    }
    
//    func getOtherUser(_ users: [User]) -> User {
//        let notCurrentUserArr = users.filter{$0.id != CurrentUser.id}
//        print(notCurrentUserArr[0].name)
//        return notCurrentUserArr[0]
//    }

    func configureConversationCell(with conversation: Conversation) -> Void {
//        let mostRecentMsgIndex = conversation.messages.count - 1
//        let mostRecentMsg = conversation.messages[mostRecentMsgIndex]
//        let otherUser = getOtherUser(conversation.users)
//        body.text = mostRecentMsg.content
//        timestamp.text = mostRecentMsg.timestamp.timeAgoDisplay()
//        let url = URL(string: otherUser.imageUrl)!
//        avatar.kf.setImage(with: url)
    }
    
}
