//
//  GroupsDB.swift
//  client-server-1436
//
//  Created by zeons on 28.08.2021.
//
import Foundation
import RealmSwift



class GroupsDB {

    let config = Realm.Configuration(schemaVersion: 0)
    lazy var mainRealm = try! Realm(configuration: config)
    var groups: [Group] = []
    var token: NotificationToken?
    
     func addData(_ user: [Group]) {
        mainRealm.beginWrite()
        groups = user
        let group = Group()
        let e = self.groups.count
        var i = 0
        while i < e {
            group.id = self.groups[i].id
            group.name = self.groups[i].name
            group.photo50 = self.groups[i].photo50
            
            mainRealm.add(user)
            i = i + 1
        }
        do {
            try mainRealm.commitWrite()
        } catch {
            print(error.localizedDescription)
        }
  
     }
 }
