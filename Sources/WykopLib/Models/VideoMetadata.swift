//
//  VideoMetadata.swift
//  WykopLib
//
//  Created by Bartłomiej Łaski on 14/02/2025.
//

struct VideoMetadata: Codable {
    let title: String
    let description: String
    let videoID: String
    let publishedAt: String
    let durationInSeconds: Int

    enum CodingKeys: String, CodingKey {
        case title, description
        case videoID = "video_id"
        case publishedAt = "published_at"
        case durationInSeconds = "duration_in_seconds"
    }
}
