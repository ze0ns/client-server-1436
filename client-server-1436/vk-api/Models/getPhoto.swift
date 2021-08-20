//
//  getPhoto.swift
//  client-server-1436
//
//  Created by Oschepkov Aleksandr on 19.08.2021.
//

import Foundation

// MARK: - GetPhotos
class GetPhotos: Codable {
    let response: Response
}

// MARK: - Response
class Response: Codable {
    let count: Int
    let items: [Item]
}

// MARK: - Item
class Item: Codable {
    let id: Int
    let photo2560, photo807, photo1280: String
    let width: Int
    let photo604, photo130: String
    let date, ownerID, postID, height: Int
    let text: String
    let hasTags: Bool
    let albumID: Int
    let photo75: String

    enum CodingKeys: String, CodingKey {
        case id
        case photo2560 = "photo_2560"
        case photo807 = "photo_807"
        case photo1280 = "photo_1280"
        case width
        case photo604 = "photo_604"
        case photo130 = "photo_130"
        case date
        case ownerID = "owner_id"
        case postID = "post_id"
        case height, text
        case hasTags = "has_tags"
        case albumID = "album_id"
        case photo75 = "photo_75"
    }
}
