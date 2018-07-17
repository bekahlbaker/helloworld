//
//  LoginVC.swift
//  HelloWorld
//
//  Created by Rebekah Baker on 5/9/18.
//  Copyright © 2018 Bekah Baker. All rights reserved.
//

import UIKit

class LoginVC: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var critterView: CritterView!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var error: UILabel!
    @IBAction func loginButtonTapped(_ sender: Any) {
        Firebase.loginAnonymously()
        
        let signedInUser = try? JSONDecoder().decode(User.self, from: FakeData.userJSON)
        SharedData.sharedInstance.user = signedInUser
        
        performSegue(withIdentifier: "toMain", sender: self)
    }
    
    private let notificationCenter: NotificationCenter = .default
    
    deinit {
        notificationCenter.removeObserver(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        usernameTextField.delegate = self
        usernameTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        
        setUpGestures()
        setUpNotification()
    }
    
    // MARK: TextField
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        let deadlineTime = DispatchTime.now() + .milliseconds(100)
        
        DispatchQueue.main.asyncAfter(deadline: deadlineTime) { // 🎩✨ Magic to ensure animation starts
            let fractionComplete = self.fractionComplete(for: textField)
            self.critterView.startHeadRotation(startAt: fractionComplete)
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == usernameTextField {
            critterView.stopHeadRotation()
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == usernameTextField {
            if (textField.text?.count)! >= 8 {
                critterView.isEcstatic = true
                critterView.isSad = false
            } else {
                critterView.isEcstatic = false
                critterView.isSad = true
                critterView.stopHeadRotation()
            }
        }
        usernameTextField.resignFirstResponder()
        return false
    }
    
    @objc private func textFieldDidChange(_ textField: UITextField) {
        guard !critterView.isActiveStartAnimating, textField == usernameTextField else { return }
        
        let fractionComplete = self.fractionComplete(for: textField)
        critterView.updateHeadRotation(to: fractionComplete)
        
        if let text = textField.text {
            critterView.isEcstatic = text.count >= 8
        }
    }
    
    // MARK: - Gestures
    
    private func setUpGestures() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc private func handleTap() {
        stopHeadRotation()
    }
    
    // MARK: - Notifications
    
    private func setUpNotification() {
        notificationCenter.addObserver(self, selector: #selector(applicationDidEnterBackground), name: .UIApplicationDidEnterBackground, object: nil)
    }
    
    @objc private func applicationDidEnterBackground() {
        stopHeadRotation()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toMain" {
            
        }
    }
    
    private func fractionComplete(for textField: UITextField) -> Float {
        guard let text = textField.text, let font = textField.font else { return 0 }
//        let textFieldWidth = textField.bounds.width - (2 * textFieldHorizontalMargin)
        let textFieldWidth = textField.bounds.width
        return min(Float(text.size(withAttributes: [NSAttributedStringKey.font : font]).width / textFieldWidth), 1)
    }
    
    private func stopHeadRotation() {
        usernameTextField.resignFirstResponder()
        critterView.stopHeadRotation()
    }
}
