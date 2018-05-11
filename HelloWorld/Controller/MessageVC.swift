//
//  DetailVC.swift
//  HelloWorld
//
//  Created by Rebekah Baker on 5/10/18.
//  Copyright © 2018 Bekah Baker. All rights reserved.
//

import UIKit

class MessageVC: UIViewController {
    
    var chatWith: String!

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        self.title = chatWith
    }

}
