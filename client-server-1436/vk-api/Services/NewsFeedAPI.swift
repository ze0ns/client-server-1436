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
    let filters = "note"
    let count = "3"
    
    

      //метод, поиск группы по ключевому слову
      func getNews(comletion: @escaping(([Item]?)->())){
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
                guard let data = response.data else {return} //Распаковали наш ответ, и проверили его. Если все хорошо - идём дальше

//                print("----------------PRINT-----------------")
//                print(response.data?.prettyJSON)
//                //добавим проверку на ошибку, если будет ошибка она выведется в консоль
                do {
                    let NewsFeedResponse = try JSONDecoder().decode(NewsFeed.self, from: data)

                    let newsFeed = NewsFeedResponse.response.items

                    comletion(newsFeed)
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
}

    




