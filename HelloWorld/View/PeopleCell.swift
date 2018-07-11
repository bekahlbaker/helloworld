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
    
    var userHasChatWithPerson = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configurePersonCell(_ user: User) -> Void {
        name.text = user.fullName().capitalized
        guard let url = URL(string: user.picture.medium) else { return }
        avatar.kf.setImage(with: url)
        hasChat.setImage(userHasChatWithPerson ? UIImage(named: "messageIcon") : UIImage(named: "arrowIcon"), for: .normal)
    }
}
