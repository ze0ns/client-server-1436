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
}

// MARK: - Item
class Friend: Codable {
    let id: Int
    let lastName: String
    let photo50: String
    let trackCode, firstName: String
    let photo100: String

    enum CodingKeys: String, CodingKey {
        case id
        case lastName = "last_name"
        case photo50 = "photo_50"
        case trackCode = "track_code"
        case firstName = "first_name"
        case photo100 = "photo_100"
    }
}
