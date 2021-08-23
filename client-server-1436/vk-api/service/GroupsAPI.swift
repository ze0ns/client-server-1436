//
//  GroupsAPI.swift
//  client-server-1436
//
//  Created by Oschepkov Aleksandr on 19.08.2021.
//
//print("----------------PRINT-----------------")
//print(response.data?.prettyJSON)

import Foundation
import Alamofire
import DynamicJSON

struct User2{
    
}

final class GroupsAPI{
    let baseUrl = "https://api.vk.com/method"
    let token = Session.shared.token
    let clientId = Session.shared.userId
    let version = "5.21"
    
    // Метод, вывести информацию о группе по ID
    func searchById(id: Int, comletion: @escaping((String)->()))
     {
        let method = "/groups.getById"

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
    
    //метод, вывести все группы пользователя
    func getGroups(comletion: @escaping(([Int]?)->())){
        let method = "/groups.get"
        
        let parameters: Parameters = [
            "owner_id": clientId,
            "access_token": Session.shared.token,
            "v":version,
            "extended": 0
            ]
        let url = baseUrl + method
        AF.request(url, method: .get, parameters: parameters).responseJSON {
            response in
        guard let data = response.data else {return} //Распаковали наш ответ, и проверили его. Если все хорошо - идём дальше
           
            //добавим проверку на ошибку, если будет ошибка она выведется в консоль
            do {
                let groupResponse = try? JSONDecoder().decode(Groups.self, from: data)
                
                let groups = groupResponse?.response.items
                
                
                comletion(groups)
            } catch DecodingError.keyNotFound(let key, let context) {
                Swift.print("could not find key \(key) in JSON: \(context.debugDescription)")
            } catch DecodingError.valueNotFound(let type, let context) {
                Swift.print("could not find type \(type) in JSON: \(context.debugDescription)")
            } catch DecodingError.typeMismatch(let type, let context) {
                Swift.print("type mismatch for type \(type) in JSON: \(context.debugDescription)")
            } catch DecodingError.dataCorrupted(let context) {
                Swift.print("data found to be corrupted in JSON: \(context.debugDescription)")
            } catch let error as NSError {
                NSLog("Error in read(from:ofType:) domain= \(error.domain), description= \(error.localizedDescription)")
            }
        }
      }
       

  /*
    //метод, поиск группы по ключевому слову
    func searchGroups(comletion: @escaping(([User2]?)->())){
            let method = "/groups.search"

            let parameters: Parameters = [
                "access_token": Session.shared.token,
                "v":version,
                "q": "музыка"
                ]
            let url = baseUrl + method
            AF.request(url, method: .get, parameters: parameters).responseJSON {
                response in
//
//                print("----------------PRINT-----------------")
//                print(response.data?.prettyJSON)


            }
    }
    */
}


