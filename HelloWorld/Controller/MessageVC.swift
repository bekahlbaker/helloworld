//
//  DetailVC.swift
//  HelloWorld
//
//  Created by Rebekah Baker on 5/10/18.
//  Copyright © 2018 Bekah Baker. All rights reserved.
//

import UIKit

class MessageVC: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
    
    @IBOutlet weak var beginConversationLabel: UILabel!
    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var beginConversationView: UIView!
    
    @IBOutlet weak var tableView: UITableView!
    

    @IBOutlet weak var messageTextField: UITextField!
    @IBAction func sendMessageButton(_ sender: Any) {
    }
    
    var messageViewModels = [MessageViewModel]()
    var userViewModel: UserViewModel!
    
    // Networking
    fileprivate func loadConversation() {
        APIRequest.makeRequestTo(endpoint: ConversationEndpoints.getAllConversations) { (data, error) in
            if data != nil {
                guard let dataReponse = data else {
                    print("Corrupted data")
                    return
                }
                let fakeConversationData = FakeData.conversationsJSON
                guard let results = try? JSONDecoder().decode(ConversationResult.self, from: fakeConversationData) else {
                    print("Can't make Result from data")
                    return
                }
                
                if let messages = results.conversations.first?.messages.map({ return MessageViewModel(message: $0)}) {
                    self.messageViewModels = messages
                    self.tableView.reloadData()
                }
                
            } else {
                print("NOPE", error ?? "")
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        messageTextField.delegate = self
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        updateUI()
        loadConversation()
    }
    
    func updateUI() {
        self.title = userViewModel.name
        avatar.kf.setImage(with: userViewModel.imageURL)
        beginConversationView.alpha = userViewModel.startConvoAlpha
        tableView.alpha = userViewModel.chatViewAlpha
        beginConversationLabel.text = userViewModel.beginConversationWithUser
    }
    
    //MARK: TableView
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messageViewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "MessageCell") as? MessageCell {
            let messageVM = messageViewModels[indexPath.row]
            cell.messageViewModel = messageVM
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    //MARK: TextField
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
}
