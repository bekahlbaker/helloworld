//
//  UserCell.swift
//  HelloWorld
//
//  Created by Rebekah Baker on 5/10/18.
//  Copyright © 2018 Bekah Baker. All rights reserved.
//

import UIKit
import Kingfisher

class UserCell: UITableViewCell {
    
    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var hasChat: UIButton!
    
    var userViewModel: UserViewModel! {
        didSet {
            name.text = userViewModel.name
            avatar.kf.setImage(with: userViewModel.imageURL)
            hasChat.setImage(UIImage(named: userViewModel.chatIconName), for: .normal)
        }
    }
}
