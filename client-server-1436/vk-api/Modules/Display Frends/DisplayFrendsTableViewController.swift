//
//  DisplayFrendsTableViewController.swift
//  client-server-1436
//
//  Created by zeons on 16.08.2021.
//

import UIKit

class DisplayFrendsTableViewController: UITableViewController {

    let frendsAPI = FrendsApi()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Получаем список друзей
        frendsAPI.getFrends {user in
            //получаем список пользователей
            //self.frends = users
            //tableView.reload
            
        }
        //Получаем все фотографии
        frendsAPI.getPhotos{user in

        }
        //Получаем список групп пользователя
        frendsAPI.getGroups{user in
               
        }
        //Поиск группы по запросу, сейчас стоит "Музыка"
        frendsAPI.searchGroups{user in
            
         }
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

   

}
