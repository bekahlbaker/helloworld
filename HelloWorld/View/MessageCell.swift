//
//  MessageCell.swift
//  HelloWorld
//
//  Created by Rebekah Baker on 5/10/18.
//  Copyright © 2018 Bekah Baker. All rights reserved.
//

import UIKit

class MessageCell: UITableViewCell {
    
    @IBOutlet weak var avatar: AvatarImageView!
    @IBOutlet weak var body: UILabel!
    @IBOutlet weak var timestamp: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configureMessageCell(_ message: Message) -> Void {
        body.text = message.content
        timestamp.text = message.timestamp
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
