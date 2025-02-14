//
//  EntryActions.swift
//  WykopLib
//
//  Created by Bartłomiej Łaski on 14/02/2025.
//

struct EntryActions: Codable {
    let update: Bool
    let delete: Bool
    let voteUp: Bool
    let createFavourite: Bool
    let deleteFavourite: Bool
    let report: Bool
    let pin: Bool
    let unpin: Bool

    enum CodingKeys: String, CodingKey {
        case update, delete
        case voteUp = "vote_up"
        case createFavourite = "create_favourite"
        case deleteFavourite = "delete_favourite"
        case report, pin, unpin
    }
}
