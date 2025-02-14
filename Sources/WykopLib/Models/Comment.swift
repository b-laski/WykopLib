//
//  Comment.swift
//  WykopLib
//
//  Created by Bartłomiej Łaski on 14/02/2025.
//

struct Comment: Codable {
    let editable: Bool
    let id: Int
    let author: Author
    let device: String
    let createdAt: String
    let voted: Int
    let content: String
    let media: Media?
    let adult: Bool
    let tags: [String]
    let favourite: Bool
    let votes: Votes
    let deletable: Bool
    let blacklist: Bool
    let deleted: String?
    let resource: String
    let actions: CommentActions
    let archive: Bool
    let slug: String
    let parent: Parent?

    enum CodingKeys: String, CodingKey {
        case editable, id, author, device
        case createdAt = "created_at"
        case voted, content, media, adult, tags, favourite, votes, deletable, blacklist, deleted, resource, actions, archive, slug, parent
    }
}
