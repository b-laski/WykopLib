//
//  Embed.swift
//  WykopLib
//
//  Created by Bartłomiej Łaski on 14/02/2025.
//

struct Embed: Codable {
    let key: String
    let type: String
    let url: String
    let thumbnail: String
    let videoMetadata: VideoMetadata?
    let ageCategory: String
    let commercial: Bool

    enum CodingKeys: String, CodingKey {
        case key, type, url, thumbnail
        case videoMetadata = "video_metadata"
        case ageCategory = "age_category"
        case commercial
    }
}
