import Foundation
import RealmSwift

// MARK: - PhotoResponse
class PhotoResponse: Codable {
    let response: Photos
    init(response: Photos){
        self.response = response
    }
}

// MARK: - Response
struct Photos: Codable {
    let count: Int
    let items: [Photo]
    
    init(count: Int, items:[Photo]) {
        self.count = count
        self.items = items
    }
}

// MARK: - Item
class Photo: Object, Codable {
    @objc dynamic var albumID, height: Int
    @objc dynamic var photo130: String
    @objc dynamic var id, width, date: Int
    @objc dynamic var text: String
    @objc dynamic var photo75: String
    @objc dynamic var hasTags: Bool
    @objc dynamic var ownerID: Int
    @objc dynamic var photo604: String
    @objc dynamic var photo807, photo1280, photo2560: String?
   

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
       
    }
}
