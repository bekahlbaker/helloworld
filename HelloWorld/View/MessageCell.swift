//
//  MessageCell.swift
//  HelloWorld
//
//  Created by Rebekah Baker on 5/10/18.
//  Copyright © 2018 Bekah Baker. All rights reserved.
//

import UIKit

class MessageCell: UITableViewCell {

    @IBOutlet weak var messageBackground: UIView!
    @IBOutlet weak var message: UILabel!
    
    @IBOutlet weak var leadingMessageConstraint: NSLayoutConstraint!
    @IBOutlet weak var trailingMessageConstraint: NSLayoutConstraint!
    
    var messageViewModel: MessageViewModel! {
        didSet {
            message.text = messageViewModel.message
            leadingMessageConstraint.constant = messageViewModel.leadingConstant
            trailingMessageConstraint.constant = messageViewModel.trailingConstant
            message.textAlignment = messageViewModel.textAlignment
            messageBackground.backgroundColor = messageViewModel.backgroundColor
        }
    }
}
