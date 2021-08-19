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

struct User2{
    
}

final class GroupsAPI{
    let baseUrl = "https://api.vk.com/method"
    let token = Session.shared.token
    let clientId = Session.shared.userId
    let version = "5.21"
        
    
    func getGroups(comletion: @escaping(([User2]?)->())){
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
            
        
            
        }
        
    }
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
            
            
            
            print("----------------PRINT-----------------")
            print(response.data?.prettyJSON)

            
        }
        
    }
    
    
    
    
}

