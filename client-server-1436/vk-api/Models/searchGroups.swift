//
//  searchGroups.swift
//  client-server-1436
//
//  Created by Oschepkov Aleksandr on 19.08.2021.

import Foundation

// MARK: - SearchGroups
class SearchGroups: Codable {
    let response: SearchGroup

    init(response: SearchGroup) {
        self.response = response
    }
}

// MARK: - Response
class SearchGroup: Codable {
    let count: Int
    let SearchItem: [SearchItem]

    init(count: Int, items: [SearchItem]) {
        self.count = count
        self.SearchItem = items
    }
}

// MARK: - Item
class SearchItem: Codable {
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

    init(isMember: Int, id: Int, photo100: String, isAdvertiser: Int, isAdmin: Int, photo50: String, photo200: String, type: TypeEnum, screenName: String, name: String, isClosed: Int) {
        self.isMember = isMember
        self.id = id
        self.photo100 = photo100
        self.isAdvertiser = isAdvertiser
        self.isAdmin = isAdmin
        self.photo50 = photo50
        self.photo200 = photo200
        self.type = type
        self.screenName = screenName
        self.name = name
        self.isClosed = isClosed
    }
}

enum TypeEnum: String, Codable {
    case group = "group"
    case page = "page"
}

