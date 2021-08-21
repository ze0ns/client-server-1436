//
//  getPhoto.swift
//  client-server-1436
//
//  Created by Oschepkov Aleksandr on 19.08.2021.
//

import Foundation

// MARK: - PhotoResponse
class PhotoResponse: Codable {
    let response: Photos

    init(response: Photos) {
        self.response = response
    }
}

// MARK: - Response
class Photos: Codable {
    let count: Int
    let items: [Photo]

    init(count: Int, items: [Photo]) {
        self.count = count
        self.items = items
    }
}

// MARK: - Item
class Photo: Codable {
    let albumID, height: Int
    let photo130: String
    let id, width, date: Int
    let text: String
    let photo75: String
    let hasTags: Bool
    let ownerID: Int
    let photo604: String
    let photo807, photo1280, photo2560: String?
    let postID: Int?

    enum CodingKeys: String, CodingKey {
        case albumID = "album_id"
        case height
        case photo130 = "photo_130"
        case id, width, date, text
        case photo75 = "photo_75"
        case hasTags = "has_tags"
        case ownerID = "owner_id"
        case photo604 = "photo_604"
        case photo807 = "photo_807"
        case photo1280 = "photo_1280"
        case photo2560 = "photo_2560"
        case postID = "post_id"
    }

    init(albumID: Int, height: Int, photo130: String, id: Int, width: Int, date: Int, text: String, photo75: String, hasTags: Bool, ownerID: Int, photo604: String, photo807: String?, photo1280: String?, photo2560: String?, postID: Int?) {
        self.albumID = albumID
        self.height = height
        self.photo130 = photo130
        self.id = id
        self.width = width
        self.date = date
        self.text = text
        self.photo75 = photo75
        self.hasTags = hasTags
        self.ownerID = ownerID
        self.photo604 = photo604
        self.photo807 = photo807
        self.photo1280 = photo1280
        self.photo2560 = photo2560
        self.postID = postID
    }
}
