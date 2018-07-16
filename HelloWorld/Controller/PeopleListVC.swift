//
//  PeopleListVC.swift
//  HelloWorld
//
//  Created by Rebekah Baker on 5/10/18.
//  Copyright © 2018 Bekah Baker. All rights reserved.
//

import UIKit

class PeopleListVC: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var searchbar: UISearchBar!
    
    var peopleList: [User] = []
    var selectedPersonsName: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableview.delegate = self
        tableview.dataSource = self
        searchbar.delegate = self

        for person in FakeData.people {
            peopleList.append(User(person))
        }
        
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let person = self.peopleList[indexPath.row]
        selectedPersonsName = person.name
        performSegue(withIdentifier: "toDetail", sender: self)
    }
    
    //MARK: Searchbar
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("Searching", searchText)
        // make API call to search - throttle
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.view.endEditing(true)
        searchBar.text = ""
        // make API call to search
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetail" {
            if let vc = segue.destination as? MessageVC {
             vc.chatWith = selectedPersonsName
            }
        }
    }
}
