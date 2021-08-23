//
//  DisplayGroupsTableViewController.swift
//  client-server-1436
//
//  Created by zeons on 21.08.2021.
//


import UIKit
import Alamofire
import DynamicJSON

class DisplayGroupsTableViewController: UITableViewController {

    let groupsAPI = GroupsAPI()

    var groups: [Int] = []
    var dict : Dictionary<Int, String> = [:]  //словарь, который мы будем заполнять id группы и её название

   
    // Метод, вывести информацию о группе по ID
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Регистрируем нашу кастомную ячейку
          tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
        //Получаем список group, добавляем его в таблицу
        groupsAPI.getGroups{ [weak self] users in

            self?.groups = users!
            let counts = users!.count
            
            var el = 0
            while counts > el {
                let key = users![el]
                self?.groupsAPI.searchById(id: key){ [weak self] names in
                    
                    self?.dict.updateValue(names, forKey: key)
                    self?.tableView.reloadData()
                }
                
                el = el + 1
            }
 
        }
}

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groups.count
         }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

             let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
             let group: Int = groups[indexPath.row]
             let name = dict[group]
             cell.textLabel!.text = "\(name ?? "")"
             return cell
         }



}

