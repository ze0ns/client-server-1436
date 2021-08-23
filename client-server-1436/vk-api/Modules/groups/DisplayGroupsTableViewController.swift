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
    var groupsDet: String = ""
    var name: String = ""
    var idGroup: Int = 35983383
    var elements: Int = 0
    var nameGroups = "" //имя группы
    var dict : Dictionary<Int, String> = [:]
    
    let baseUrl = "https://api.vk.com/method"
    let token = Session.shared.token
    let clientId = Session.shared.userId
    let version = "5.21"
    
    
    
    //Функция преобразования
    func searchById(id: Int, comletion: @escaping((String)->()))
     {
        let method = "/groups.getById"
        var nameGroup: String = ""

        let parameters: Parameters = [
            "access_token": Session.shared.token,
            "v":version,
            "group_id":id,
            "fields": "description"
        ]
        let url = baseUrl + method
        AF.request(url, method: .get, parameters: parameters).responseJSON {
            response in
           
            
            guard let data =  response.data else {return} //Распаковали наш ответ, и проверили его. Если все хорошо - идём дальше
      
            guard let items = JSON(data).response.array else {return}
            let groups = items.map {GroupsDynamic(json: $0)}
            let name = groups[0].name
            comletion(name)
        }
}
    
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
                self?.searchById(id: key){ [weak self] names in
                    //self!.nameGroups = names
                    self?.dict.updateValue(names, forKey: key)
                    self?.tableView.reloadData()
                }
                
                el = el + 1
            }
 
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
            let n = dict[group]

             cell.textLabel?.text = "\(n)"
            
            return cell
         }



}

