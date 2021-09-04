//
//  VkFB.swift
//  client-server-1436
//
//  Created by zeons on 04.09.2021.
//


import Foundation
import Firebase

 class VkFB {

    
     let id: Int

     let ref: DatabaseReference?

     init(id: Int) {
         self.ref = nil
         self.id = id
     }

     init?(snapshot: DataSnapshot) {

         guard
             let value = snapshot.value as? [String: Any],
             let id = value["id"] as? Int
            
         else {
             return nil
         }

         self.ref = snapshot.ref
         self.id = id
     }

     func toAnyObject() -> [AnyHashable: Any] {
         return
             [
               "id": id ] as [AnyHashable: Any]
     }
 }
