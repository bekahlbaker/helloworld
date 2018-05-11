//
//  ConversationCell.swift
//  HelloWorld
//
//  Created by Rebekah Baker on 5/11/18.
//  Copyright © 2018 Bekah Baker. All rights reserved.
//

import UIKit

class ConversationCell: UITableViewCell {
    
    @IBOutlet weak var avatar: AvatarImageView!
    @IBOutlet weak var body: UILabel!
    @IBOutlet weak var timestamp: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureConversationCell(_ conversation: Conversation) -> Void {
        let mostRecentMessage = conversation.messages.count - 1
        body.text = conversation.messages[mostRecentMessage].content
//        timestamp.text = message.timestamp
    }
    
    // Set up Kingfisher or something to cache images
    func loadImage(_ url: String) {
        DispatchQueue.global().async { [weak self] in
            if let imageUrl = URL(string: url) {
                if let data = try? Data(contentsOf: imageUrl) {
                    if let image = UIImage(data: data) {
                        DispatchQueue.main.async {
                            self?.avatar.image = image
                        }
                    }
                }
            }
        }
    }
    
}
