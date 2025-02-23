//
//  BaseURL.swift
//  WykopLib
//
//  Created by Bartłomiej Łaski on 15/02/2025.
//

import Foundation

enum BaseURL {
    case v3
    case custom(URL)

    var url: URL {
        switch self {
        case .v3:
            return URL(string: "https://wykop.pl/api/v3")!
        case .custom(let url):
            return url
        }
    }
}
