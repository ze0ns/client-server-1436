//
//  DisplayGroupsTableViewController.swift
//  client-server-1436
//
//  Created by zeons on 21.08.2021.
//


import UIKit

class DisplayGroupsTableViewController: UITableViewController {

    let groupsAPI = GroupsAPI()
    
    var groups: [Int] = []
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        //Регистрируем нашу кастомную ячейку
          tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
        //Получаем список друзей, добавляем его в таблицу
        groupsAPI.getGroups{ [weak self] users in

            self?.groups = users!
            self?.tableView.reloadData()

        }
    
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
             // #warning Incomplete implementation, return the number of rows
        return groups.count
         }
    

         override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

             let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

             let group: Int = groups[indexPath.row]

            cell.textLabel?.text = "\(group)"

             return cell
         }



}

