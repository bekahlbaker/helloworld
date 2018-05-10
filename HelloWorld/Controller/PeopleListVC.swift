//
//  PeopleListVC.swift
//  HelloWorld
//
//  Created by Rebekah Baker on 5/10/18.
//  Copyright © 2018 Bekah Baker. All rights reserved.
//

import UIKit

class PeopleListVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableview: UITableView!
    
    var peopleList: [User] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableview.delegate = self
        tableview.dataSource = self

        peopleList.append(User("Sara Jones", "https://cdn.gratisography.com/photos/424H.jpg"))
        peopleList.append(User("Benjamin Williams", "https://cdn.gratisography.com/photos/196H.jpg"))
        peopleList.append(User("Ostrich", "https://cdn.gratisography.com/photos/16H.jpg"))
        tableview.reloadData()
    }
    
    //MARK: Tableview
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return peopleList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "PeopleCell") as? PeopleCell {
            let person = self.peopleList[indexPath.row]
            cell.configurePersonCell(person)
            
            return cell
        }
        return PeopleCell()
    }

}
