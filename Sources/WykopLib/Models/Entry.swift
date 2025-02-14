//
//  Entry.swift
//  WykopLib
//
//  Created by Bartłomiej Łaski on 14/02/2025.
//

struct Entry: Codable {
    let editable: Bool
    let id: Int
    let author: Author
    let device: String
    let createdAt: String
    let voted: Int
    let content: String
    let media: Media
    let adult: Bool
    let tags: [String]
    let favourite: Bool
    let deletable: Bool
    let slug: String
    let votes: Votes
    let comments: Comments
    let parentId: Int
    let resource: String
    let actions: EntryActions
    let archive: Bool
    let deleted: Bool
    let observedDiscussion: Bool
    let pinnable: Bool

    enum CodingKeys: String, CodingKey {
        case editable, id, author, device
        case createdAt = "created_at"
        case voted, content, media, adult, tags, favourite, deletable, slug, votes, comments
        case parentId = "parent_id"
        case resource, actions, archive, deleted
        case observedDiscussion = "observed_discussion"
        case pinnable
    }
}
