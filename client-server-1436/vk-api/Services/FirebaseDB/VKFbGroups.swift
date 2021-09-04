//
//  VKFbGroups.swift
//  client-server-1436
//
//  Created by zeons on 04.09.2021.
//
import Foundation
import Firebase

class VKFbGroups {

    let name: String
    let id: Int

    let ref: DatabaseReference?

    init(name: String, id: Int) {
        self.ref = nil
        self.name = name
        self.id = id
    }

    init?(snapshot: DataSnapshot) {

        guard
            let value = snapshot.value as? [String: Any],
            let id = value["id"] as? Int,
            let name = value["name"] as? String
        else {
            return nil
        }

        self.ref = snapshot.ref
        self.name = name
        self.id = id
    }

    func toAnyObject() -> [AnyHashable: Any] {
        return
            [ "name": name,
              "id": id ] as [AnyHashable: Any]
    }
}
