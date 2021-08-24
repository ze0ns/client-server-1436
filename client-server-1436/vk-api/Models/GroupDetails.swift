//
//  GroupDetails.swift
//  client-server-1436
//
//  Created by zeons on 22.08.2021.
//
import Foundation
import DynamicJSON

 struct GroupsDynamic {
     var id: Int = 0
     var is_closed: Int = 0
     var is_advertiser: Int = 0
     var description: String = ""
     var type : String = "page"
     var is_memberInt = 0
     var photo50: String = ""
     var photo200: String = ""
     var isAdmin: Int = 0
     var photo100: String = ""
     var name: String = ""
     var screenName: String = ""
      

     init(json: JSON) {
         self.id = json.id.int ?? 0 //json["id"] as! Int
         self.name = json.name.string ?? "" //json["first_name"] as! String
         self.description = json.description //json["last_name"] as! String
     }
 }
