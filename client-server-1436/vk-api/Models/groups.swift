//
//  groups.swift
//  client-server-1436
//
//  Created by Oschepkov Aleksandr on 19.08.2021.
//

import Foundation

// MARK: - GetPhotos
class getGroups: Codable {
    let response: ResponseGetGroups
}

// MARK: - Response
class ResponseGetGroups: Codable {
    let count: Int
    let items: [Int]
}
