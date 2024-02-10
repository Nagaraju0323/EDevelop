//
//  ImageModel.swift
//  EDeveloper
//
//  Created by Nagaraju on 08/02/24.
//

import Foundation

struct ImageModel: Codable {
    let success: Bool
    let totalPhotos: Int
    let message: String
    let offset, limit: Int
    let photos: [Photo]

    enum CodingKeys: String, CodingKey {
        case success
        case totalPhotos = "total_photos"
        case message, offset, limit, photos
    }
}

// MARK: - Photo
struct Photo: Codable {
    let url: String
    let title: String
    let user, id: Int
    let description: String
}
