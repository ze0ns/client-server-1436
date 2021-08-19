//
//  DisplayFrendsTableViewController.swift
//  client-server-1436
//
//  Created by zeons on 16.08.2021.
//

import UIKit

class DisplayFrendsTableViewController: UITableViewController {

    let friendsAPI = FriendsApi()
    var friends: [Friend] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Регистрируем нашу кастомную ячейку
          tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
        //Получаем список друзей
        friendsAPI.getFrends { [weak self] users in
            
            self?.friends = users!
            self?.tableView.reloadData()
            
        }
        //Получаем все фотографии
        friendsAPI.getPhotos{user in

        }
//        //Получаем список групп пользователя
//        frendsAPI.getGroups{user in
//               
//        }
//        //Поиск группы по запросу, сейчас стоит "Музыка"
//        frendsAPI.searchGroups{user in
//            
//         }
        
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
             // #warning Incomplete implementation, return the number of rows
             return friends.count
         }

         override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

             let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

             let friend: Friend = friends[indexPath.row]

             cell.textLabel?.text = "\(friend.firstName) \(friend.lastName)"

             return cell
         }

   

}
