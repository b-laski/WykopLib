//
//  Photo.swift
//  WykopLib
//
//  Created by Bartłomiej Łaski on 14/02/2025.
//

struct Photo: Codable {
    let key: String
    let label: String
    let mimeType: String
    let url: String
    let size: Int
    let width: Int
    let height: Int

    enum CodingKeys: String, CodingKey {
        case key, label
        case mimeType = "mime_type"
        case url, size, width, height
    }
}
