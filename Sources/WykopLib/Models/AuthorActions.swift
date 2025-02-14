//
//  AuthorActions.swift
//  WykopLib
//
//  Created by Bartłomiej Łaski on 14/02/2025.
//

struct AuthorActions: Codable {
    let update: Bool
    let updateGender: Bool
    let updateNote: Bool
    let blacklist: Bool
    let follow: Bool

    enum CodingKeys: String, CodingKey {
        case update
        case updateGender = "update_gender"
        case updateNote = "update_note"
        case blacklist, follow
    }
}
