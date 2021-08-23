//
//  Frends.swift
//  client-server-1436
//
//  Created by zeons on 18.08.2021.
//

import Foundation

// MARK: - FriendsResponse
class FriendsResponse: Codable {
    let response: Friends
}

// MARK: - Response
class Friends: Codable {
    let count: Int
    let items: [Friend]
    
    init(count: Int, items: [Friend]) {
        self.count = count
        self.items = items
    }
}


// MARK: - Item
class Friend: Codable {
    @objc dynamic var id: Int
    @objc dynamic var lastName: String
    @objc dynamic var photo50: String
    @objc dynamic var trackCode, firstName: String
    @objc dynamic var photo100: String

    enum CodingKeys: String, CodingKey {
        case id
        case lastName = "last_name"
        case photo50 = "photo_50"
        case trackCode = "track_code"
        case firstName = "first_name"
        case photo100 = "photo_100"
    }
    
    init(id: Int, lastName: String, photo50: String, trackCode: String, firstName: String, photo100: String) {
        self.id = id
        self.lastName = lastName
        self.photo50 = photo50
        self.trackCode = trackCode
        self.firstName = firstName
        self.photo100 = photo100
    }
}
