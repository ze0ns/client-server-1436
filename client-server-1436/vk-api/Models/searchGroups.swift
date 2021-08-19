//
//  searchGroups.swift
//  client-server-1436
//
//  Created by Oschepkov Aleksandr on 19.08.2021.
//

import Foundation

// MARK: - SearchGroups
struct SearchGroups: Codable {
    let response: ResponseSearchGroups
}

// MARK: - Response
struct ResponseSearchGroups: Codable {
    let count: Int
    let items: [ItemSearchGroups]
}

// MARK: - Item
struct ItemSearchGroups: Codable {
    let isMember, id: Int
    let photo100: String
    let isAdvertiser, isAdmin: Int
    let photo50, photo200: String
    let type: TypeEnum
    let screenName, name: String
    let isClosed: Int

    enum CodingKeys: String, CodingKey {
        case isMember = "is_member"
        case id
        case photo100 = "photo_100"
        case isAdvertiser = "is_advertiser"
        case isAdmin = "is_admin"
        case photo50 = "photo_50"
        case photo200 = "photo_200"
        case type
        case screenName = "screen_name"
        case name
        case isClosed = "is_closed"
    }
}

enum TypeEnum: String, Codable {
    case group = "group"
    case page = "page"
}
