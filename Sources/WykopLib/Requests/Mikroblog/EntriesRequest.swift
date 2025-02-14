//
//  Untitled.swift
//  WykopLib
//
//  Created by Bartłomiej Łaski on 14/02/2025.
//

import Combine
import Foundation

enum EntriesSortType: String {
    case newest
    case active
    case hot
}

enum EntriesFilter: String {
    case hour = "1"
    case twoHouers = "2"
    case threeHours = "3"
    case sixHours = "6"
    case twelveHours = "12"
    case day = "24"
}

enum Entries {
    case fetchEntries(page: Int, limit: Int, category: String?, bucket: String?, multimedia: Bool, sort: EntriesSortType, filter: EntriesFilter)
    case sendNewEntries(body: EntryDataContent)
    case fetchSpecificEntries(entryId: Int)
    case editSpecificEntry(entryId: Int, newEntry: EntryDataContent)
    case deleteSpecificEntry(entryId: Int)
    case fetchVotes(entryId: Int, page: Int)
    case addVote(entryId: Int)
    case removeVote(entryId: Int)
    case fetchCountNewEntries(entryId: Int, category: String?, multimedia: Bool)
    case startObserveDiscussions(entryId: Int)
    case stopObserveDiscussions(entryId: Int)
}

extension Entries: RequestType {

    var path: String {
        switch self {
        case .fetchEntries, .sendNewEntries:
            return "/entries"

        case .fetchSpecificEntries(let entryId),
             .editSpecificEntry(let entryId, _),
             .deleteSpecificEntry(let entryId):
            return "/entries/\(entryId)"

        case .fetchVotes(let entryId, _),
             .addVote(let entryId),
             .removeVote(let entryId):
            return "/entries/\(entryId)/votes"

        case .fetchCountNewEntries(let entryId, _, _):
            return "/entries/\(entryId)/newer"

        case .startObserveDiscussions(let entryId),
             .stopObserveDiscussions(let entryId):
            return "/entries/\(entryId)/observed-discussions"
        }
    }

    var method: RequestMethods {
        switch self {
        case .fetchEntries,
             .fetchSpecificEntries,
             .fetchVotes,
             .fetchCountNewEntries:
            return .GET

        case .sendNewEntries,
             .addVote,
             .startObserveDiscussions:
            return .POST

        case .editSpecificEntry:
            return .PUT

        case .deleteSpecificEntry,
             .removeVote,
             .stopObserveDiscussions:
            return .DELETE
        }
    }

    var queryItems: [URLQueryItem] {
        switch self {
        case .fetchEntries(let page,
                           let limit,
                           let category,
                           let bucket,
                           let multimedia,
                           let sort,
                           let filter):
            return [
                URLQueryItem(name: "page", value: page.description),
                URLQueryItem(name: "limit", value: limit.description),
                URLQueryItem(name: "category", value: category?.description),
                URLQueryItem(name: "bucket", value: bucket?.description),
                URLQueryItem(name: "multimedia", value: multimedia.description),
                URLQueryItem(name: "sort", value: sort.rawValue),
                URLQueryItem(name: "filter", value: filter.rawValue)
            ]

        case .fetchVotes(_, let page):
            return [URLQueryItem(name: "page", value: page.description)]

        case .fetchCountNewEntries(_, let category, let multimedia):
            return [
                URLQueryItem(name: "category", value: category?.description),
                URLQueryItem(name: "multimedia", value: multimedia.description)
            ]

        default:
            return []
        }
    }

    var body: Data? {
        switch self {
        case .sendNewEntries(body: let body),
             .editSpecificEntry(_, newEntry: let body):
            return try? JSONEncoder().encode(body)

        default:
            return nil
        }
    }
}
