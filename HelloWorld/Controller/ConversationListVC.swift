//
//  MessageListVC.swift
//  HelloWorld
//
//  Created by Rebekah Baker on 5/10/18.
//  Copyright © 2018 Bekah Baker. All rights reserved.
//

import UIKit

class ConversationListVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
 
    @IBOutlet weak var tableview: UITableView!
    
    var conversations = [Conversation]()
    var selectedPersonsName: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableview.delegate = self
        tableview.dataSource = self
        
        for conversation in FakeData.conversation {
            conversations.append(Conversation(conversation))
        }
        print(conversations.count)
    }
    
    //MARK: Tableview
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return conversations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ConversationCell") as? ConversationCell
        {
            let conversationAtIndex = self.conversations[indexPath.row]
            cell.configureConversationCell(with: conversationAtIndex)
//            let user = message.getUser(1)
//            cell.loadImage(user.imageUrl)

            return cell
        }
        return ConversationCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toDetail", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetail" {
            if let vc = segue.destination as? MessageVC {
                vc.chatWith = selectedPersonsName
            }
        }
    }

}
