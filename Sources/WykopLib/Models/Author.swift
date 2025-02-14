//
//  Author.swift
//  WykopLib
//
//  Created by Bartłomiej Łaski on 14/02/2025.
//

// MARK: - Author
struct Author: Codable {
    let username: String
    let company: Bool
    let gender: String
    let avatar: String
    let note: Bool
    let online: Bool
    let status: String
    let color: Color
    let verified: Bool
    let follow: Bool
    let rank: Rank
    let actions: AuthorActions
}
