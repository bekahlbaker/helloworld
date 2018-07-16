//
//  LoginVC.swift
//  HelloWorld
//
//  Created by Rebekah Baker on 5/9/18.
//  Copyright © 2018 Bekah Baker. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    
    @IBOutlet weak var error: UILabel!

    @IBAction func signInWithFacebook(_ sender: Any) {
        // Perform Facebook Authentication
        // get user back and set shared instance of user

        let signedInUser = try? JSONDecoder().decode(User.self, from: FakeData.userJSON)
        SharedData.sharedInstance.user = signedInUser
        
        error.createErrorTextLabel(withString: "Hello Error")
        
        performSegue(withIdentifier: "toMain", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toMain" {
            
        }
    }
}
