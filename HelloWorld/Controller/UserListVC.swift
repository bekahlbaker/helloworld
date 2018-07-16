//
//  UserListVC.swift
//  HelloWorld
//
//  Created by Rebekah Baker on 5/10/18.
//  Copyright © 2018 Bekah Baker. All rights reserved.
//

import UIKit

class UserListVC: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var searchbar: UISearchBar!
    
    var userViewModels: [UserViewModel] = []
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
                
                self.userViewModels = results.users.map({ return UserViewModel(user: $0)})
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
        return userViewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell") as? UserCell {
            let userVM = self.userViewModels[indexPath.row]
            cell.userViewModel = userVM
            
            return cell
        }
        return UserCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let person = self.userViewModels[indexPath.row]
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
