//
//  LoginVC.swift
//  HelloWorld
//
//  Created by Rebekah Baker on 5/9/18.
//  Copyright © 2018 Bekah Baker. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var error: UILabel!
    @IBAction func loginButtonTapped(_ sender: Any) {
        Firebase.loginAnonymously()
        
        let signedInUser = try? JSONDecoder().decode(User.self, from: FakeData.userJSON)
        SharedData.sharedInstance.user = signedInUser
        
        performSegue(withIdentifier: "toMain", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toMain" {
            
        }
    }
}
