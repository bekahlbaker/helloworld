//
//  PeopleCell.swift
//  HelloWorld
//
//  Created by Rebekah Baker on 5/10/18.
//  Copyright © 2018 Bekah Baker. All rights reserved.
//

import UIKit
import Kingfisher

class PeopleCell: UITableViewCell {
    
    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var hasChat: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configurePersonCell(_ user: User) -> Void {
        name.text = user.fullName()
//        let url = URL(string: user.imageUrl)!
//        avatar.kf.setImage(with: url)
    }
}
