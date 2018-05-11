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
        // get user back and assign id
        Login.withFacebook { (authorizedUser) in
            CurrentUser.id = authorizedUser.id
        }
        performSegue(withIdentifier: "toMain", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        error.text = ""
    }
    
    func setErrorText(to errorText: String = "") -> Void {
        error.text = errorText
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toMain" {
            
        }
    }
}
