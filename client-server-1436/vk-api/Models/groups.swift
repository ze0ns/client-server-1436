//
//  groups.swift
//  client-server-1436
//
//  Created by Oschepkov Aleksandr on 19.08.2021.
//

import Foundation

// MARK: - Groups
class Groups: Codable {
    let response: Response

    init(response: Response) {
        self.response = response
    }
}

// MARK: - Response
class Response: Codable {
    let count: Int
    let items: [Int]

    init(count: Int, items: [Int]) {
        self.count = count
        self.items = items
    }
}
