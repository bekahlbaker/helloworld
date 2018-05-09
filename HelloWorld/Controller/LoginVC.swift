//
//  LoginVC.swift
//  HelloWorld
//
//  Created by Rebekah Baker on 5/9/18.
//  Copyright © 2018 Bekah Baker. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    
    @IBAction func beginChatting(_ sender: Any) {
    }
    @IBOutlet weak var usernameTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    @IBOutlet weak var error: UILabel!
    @IBOutlet weak var go: UIButton!
    @IBAction func goToChat(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}
