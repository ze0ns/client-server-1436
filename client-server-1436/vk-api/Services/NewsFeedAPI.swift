//
//  NewsFeedAPI.swift
//  client-server-1436
//
//  Created by Oschepkov Aleksandr on 08.09.2021.
//

//print("----------------PRINT-----------------")
//print(response.data?.prettyJSON)

import Foundation
import Alamofire
import DynamicJSON

struct UserNews{
    
}

final class NewsFeedAPI{
    let baseUrl = "https://api.vk.com/method"
    let token = Session.shared.token
    let clientId = Session.shared.userId
    let version = "5.131"
    let filters = "post"
    let count = "2"
    let scope = ["offline","photos","wall","frends"]
    

      //метод, поиск группы по ключевому слову
      func getNews(comletion: @escaping(([UserNews]?)->())){
              let method = "/newsfeed.get"

              let parameters: Parameters = [
                  "filters": filters,
                  "count":count,
                  "access_token": Session.shared.token,
                  "v": version
                  ]
              let url = baseUrl + method
              AF.request(url, method: .get, parameters: parameters).responseJSON {
                  response in
  
                  print("----------------PRINT-----------------")
                  print(response.data?.prettyJSON)

              }
      }

    


}

////метод, вывести все группы пользователя
//func getGroups(comletion: @escaping(([Group]?)->())){
//    let method = "/groups.get"
//
//    let parameters: Parameters = [
//        "owner_id": clientId,
//        "access_token": Session.shared.token,
//        "v":version,
//        "extended": 1
//        ]
//    let url = baseUrl + method
//    AF.request(url, method: .get, parameters: parameters).responseJSON {
//        response in
//        guard let data = response.data else {return} //Распаковали наш ответ, и проверили его. Если все хорошо - идём дальше
//
//        //добавим проверку на ошибку, если будет ошибка она выведется в консоль
//        do {
//            let groupResponse = try? JSONDecoder().decode(Groups.self, from: data)
//
//            let groups = groupResponse?.response.items
//
//            comletion(groups)
//        } catch DecodingError.keyNotFound(let key, let context) {
//            Swift.print("could not find key \(key) in JSON: \(context.debugDescription)")
//        } catch DecodingError.valueNotFound(let type, let context) {
//            Swift.print("could not find type \(type) in JSON: \(context.debugDescription)")
//        } catch DecodingError.typeMismatch(let type, let context) {
//            Swift.print("type mismatch for type \(type) in JSON: \(context.debugDescription)")
//        } catch DecodingError.dataCorrupted(let context) {
//            Swift.print("data found to be corrupted in JSON: \(context.debugDescription)")
//        } catch let error as NSError {
//            NSLog("Error in read(from:ofType:) domain= \(error.domain), description= \(error.localizedDescription)")
//        }
//    }
//  }
