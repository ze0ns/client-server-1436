//
//  FriendsApi.swift
//  client-server-1436
//
//  Created by Oschepkov Aleksandr on 18.08.2021.
//

import Foundation
import Alamofire

struct User{
    
}

final class FriendsApi{
    let baseUrl = "https://api.vk.com/method"
    let token = Session.shared.token
    let clientId = Session.shared.userId
    let version = "5.21"
    
    func getFrends(comletion: @escaping(([Friend]?)->())){
        let method = "/friends.get"
        
        let parameters: Parameters = [
            "user_id": clientId,
            "order": "name",
            "count": 1000,
            "fields": "photo_100, photo_50",
            "access_token": Session.shared.token,
            "v":version]
        
        let url = baseUrl + method
        AF.request(url, method: .get, parameters: parameters).responseJSON {
            response in
          
            guard let data = response.data else {return} //Распаковали наш ответ, и проверили его. Если все хорошо - идём дальше
           
            //добавим проверку на ошибку, если будет ошибка она выведется в консоль
            do {
                let friendsResponse = try? JSONDecoder().decode(FriendsResponse.self, from: data)
                
                let friends = friendsResponse?.response.items
                
                
                comletion(friends)
            }
            catch{
                print(error)
            }
        }
        
    }
}
