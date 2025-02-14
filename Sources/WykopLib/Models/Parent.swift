//
//  Parent.swift
//  WykopLib
//
//  Created by Bartłomiej Łaski on 14/02/2025.
//

struct Parent: Codable {
    let resource: String
    let id: Int
    let slug: String
    let author: Author
    let location: [Location]
}
