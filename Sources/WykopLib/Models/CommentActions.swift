//
//  CommentActions.swift
//  WykopLib
//
//  Created by Bartłomiej Łaski on 14/02/2025.
//

struct CommentActions: Codable {
    let update: Bool
    let delete: Bool
    let voteUp: Bool
    let voteDown: Bool
    let createFavourite: Bool
    let deleteFavourite: Bool
    let report: Bool

    enum CodingKeys: String, CodingKey {
        case update, delete
        case voteUp = "vote_up"
        case voteDown = "vote_down"
        case createFavourite = "create_favourite"
        case deleteFavourite = "delete_favourite"
        case report
    }
}
