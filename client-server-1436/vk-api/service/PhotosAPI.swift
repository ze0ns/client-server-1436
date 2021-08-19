//
//  PhotosAPI.swift
//  client-server-1436
//
//  Created by Oschepkov Aleksandr on 19.08.2021.
//

import Foundation
import Alamofire

struct User1{
    
}
final class PhotosAPI{
    let baseUrl = "https://api.vk.com/method"
    let token = Session.shared.token
    let clientId = Session.shared.userId
    let version = "5.21"
    
    
    //получаем фотографии
    func getPhotos(comletion: @escaping(([User1]?)->())){
        let method = "/photos.getAll"
        
        let parameters: Parameters = [
            "owner_id": clientId,
            "access_token": Session.shared.token,
            "v":version,
            "offset": 0,
            "no_service_albums":0,
            "count": 150,
            "extended": 0
            ]
        let url = baseUrl + method
        AF.request(url, method: .get, parameters: parameters).responseJSON {
            response in
            
            guard let data = response.data else {return} //Распаковали наш ответ, и проверили его. Если все хорошо - идём дальше
            
            //добавим проверку на ошибку, если будет ошибка она выведется в консоль
            do {
                let friendsResponse = try? JSONDecoder().decode(FriendsResponse.self, from: data)
                
                let friends = friendsResponse?.response.items
                
                comletion([])
            }
            catch{
                print(error)
            }
            
            
        }
        
    }
    
    
    
}
