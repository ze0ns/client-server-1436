//
//  DisplayGroupsTableViewController.swift
//  client-server-1436
//
//  Created by zeons on 21.08.2021.
//


import UIKit
import Alamofire
import RealmSwift



class DisplayGroupsTableViewController: UITableViewController {
    
    let groupsAPI = GroupsAPI()
    let groupDB = GroupsDB()
    var groups: [Group] = []
    
    let config = Realm.Configuration(schemaVersion: 0)
    lazy var mainRealm = try! Realm(configuration: config)
    var token: NotificationToken?
    
        override func viewDidLoad() {
            super.viewDidLoad()
            let users = mainRealm.objects(Group.self)
            //Регистрируем нашу кастомную ячейку
            tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
            
            self.token = users.observe {  (changes: RealmCollectionChange) in
                        switch changes {
                        case .initial(let results):
                            self.tableView.reloadData()
                            print(results)
                        case .update(_, let deletions, let insertions, let modifications):
                                        self.tableView.beginUpdates()
                                        self.tableView.insertRows(at: insertions.map({ IndexPath(row: $0, section: 0) }),
                                                             with: .automatic)
                                        self.tableView.deleteRows(at: deletions.map({ IndexPath(row: $0, section: 0)}),
                                                             with: .automatic)
                                        self.tableView.reloadRows(at: modifications.map({ IndexPath(row: $0, section: 0) }),
                                                             with: .automatic)
                                        self.tableView.endUpdates()
                            
                        case .error(let error):
                            print(error)
                        }
                        print("данные изменились")

                    }
        
            groups = Array(users)
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
