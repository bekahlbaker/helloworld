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
    var selectedUserViewModel: UserViewModel!
    
    // Networking
    fileprivate func loadUsers() {
        APIRequest.makeRequestTo(endpoint: UserEndpoints.getUsers(countOf: 10)) { (data, error) in
            if data != nil {
                guard let dataReponse = data else {
                    print("Corrupted data")
                    return
                }
                
                let fakeUsersList = FakeData.usersListJSON
                guard let results = try? JSONDecoder().decode(UserResult.self, from: fakeUsersList) else {
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
        selectedUserViewModel = self.userViewModels[indexPath.row]
        performSegue(withIdentifier: "toDetail", sender: self)
    }
    
    //MARK: Searchbar
    fileprivate func searchUserListFor(_ searchText: String) {
        if searchText == "" {
            loadUsers()
        } else {
            self.userViewModels = self.userViewModels.filter({ $0.name.contains(searchText) })
            self.tableview.reloadData()
        }
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchUserListFor(searchText)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchUserListFor(searchBar.text!)
        self.view.endEditing(true)
        searchBar.text = ""
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetail" {
            if let vc = segue.destination as? MessageVC {
             vc.userViewModel = selectedUserViewModel
            }
        }
    }
}
