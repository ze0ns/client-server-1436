import Foundation

// MARK: - PhotoResponse
struct PhotoResponse: Codable {
    let response: Photos
}

// MARK: - Response
struct Photos: Codable {
    let count: Int
    let items: [Photo]
}

// MARK: - Item
struct Photo: Codable {
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
}
