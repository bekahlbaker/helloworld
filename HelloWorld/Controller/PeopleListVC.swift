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
    
    // Networking
    fileprivate func loadUsers() {
        APIRequest.makeRequestTo(endpoint: UserEndpoints.getUsers(countOf: 3)) { (data, error) in
            if data != nil {
                guard let dataReponse = data else {
                    print("Corrupted data")
                    return
                }
                
                guard let results = try? JSONDecoder().decode(Result.self, from: dataReponse) else {
                    print("Can't make Result from data")
                    return
                }
                
                self.peopleList = results.users
                
                self.tableview.reloadData()
                
            } else {
                print("NOPE", error ?? "")
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableview.delegate = self
        tableview.dataSource = self
        searchbar.delegate = self

        loadUsers()
    }
    
    //MARK: Tableview
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return peopleList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "PeopleCell") as? PeopleCell {
            let person = self.peopleList[indexPath.row]
            print(person)
            cell.configurePersonCell(person)
            
            return cell
        }
        return PeopleCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let person = self.peopleList[indexPath.row]
        selectedPersonsName = person.fullName()
        performSegue(withIdentifier: "toDetail", sender: self)
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
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
