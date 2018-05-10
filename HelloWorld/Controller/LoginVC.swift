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
        loginView.alpha = 1
    }
    @IBOutlet weak var loginView: UIView!
    @IBOutlet weak var usernameTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    @IBOutlet weak var error: UILabel!
    @IBOutlet weak var go: UIButton!
    @IBAction func goToChat(_ sender: Any) {
        if let username = usernameTextfield.text, let password = passwordTextfield.text {
            if checkIfLoginCredentialsAreValid(username, password) {
                setErrorText()
                clearLoginView()
                performSegue(withIdentifier: "toMain", sender: self)
            } else {
               setErrorText(to: "Please enter your login credentials")
            }
        }
    }
    @IBAction func signInWithFacebook(_ sender: Any) {
        // Perform Facebook Authentication
        performSegue(withIdentifier: "toMain", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loginView.alpha = 0
        error.text = ""
    }
    
    // Check for valid email
    func checkIfLoginCredentialsAreValid(_ username: String, _ password: String) -> Bool {
        if username != "" && password != "" {
            return true
        }
        return false
    }
    
    func setErrorText(to errorText: String = "") -> Void {
        error.text = errorText
    }
    
    func clearLoginView() -> Void {
        loginView.alpha = 0
        usernameTextfield.text = ""
        passwordTextfield.text = ""
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toMain" {
            
        }
    }
}
