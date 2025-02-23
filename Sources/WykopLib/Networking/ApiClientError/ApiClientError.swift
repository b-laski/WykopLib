//
//  ApiClientError.swift
//  WykopLib
//
//  Created by Bartłomiej Łaski on 15/02/2025.
//

import Foundation

struct ApiClientError: Codable {
    let code: Int
    let hash: String
    let error: ErrorMessage
}

struct ErrorMessage: Codable {
    let key: Int
    let message: String
}

extension ApiClientError: Error { }

extension ApiClientError: LocalizedError {
    var errorDescription: String? {
        return "[❗️❗️❗️][Error] :: code: \(code), hash: \(hash), message: \(error.message)"
    }
}
