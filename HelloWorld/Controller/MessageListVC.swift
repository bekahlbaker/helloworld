//
//  MessageListVC.swift
//  HelloWorld
//
//  Created by Rebekah Baker on 5/10/18.
//  Copyright © 2018 Bekah Baker. All rights reserved.
//

import UIKit

class MessageListVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableview: UITableView!
    
    var messageList: [Message] = []

    var selectedPersonsName: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableview.delegate = self
        tableview.dataSource = self
        
        messageList.append(Message("Hello, how are you?"))
        messageList.append(Message("Wanna get some lunch?"))
        messageList.append(Message("Let's go see a movie!"))

    }
    
    //MARK: Tableview
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messageList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "MessageCell") as? MessageCell {
            let message = self.messageList[indexPath.row]
            cell.configureMessageCell(message)
            let user = message.getUser(1)
            cell.loadImage(user.imageUrl)
            
            return cell
        }
        return PeopleCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toDetail", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetail" {
            if let vc = segue.destination as? DetailVC {
                vc.chatWith = selectedPersonsName
            }
        }
    }

}
