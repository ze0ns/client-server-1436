//
//  DisplayGroupsTableViewController.swift
//  client-server-1436
//
//  Created by zeons on 21.08.2021.
//


import UIKit
import Alamofire

class DisplayGroupsTableViewController: UITableViewController {

        let groupsAPI = GroupsAPI()
        let groupDB = GroupsDB()
        var groups: [Group] = []
        
        

        override func viewDidLoad() {
            super.viewDidLoad()
            //Регистрируем нашу кастомную ячейку
              tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
            groups = groupDB.fetch()
            
        
        }

        // MARK: - Table view data source

        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
                 // #warning Incomplete implementation, return the number of rows
                 return groups.count
             }

             override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

                 let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

                 let group: Group = groups[indexPath.row]
                
                cell.textLabel?.text = "\(group.name)"

                 return cell
             }

       

    }
