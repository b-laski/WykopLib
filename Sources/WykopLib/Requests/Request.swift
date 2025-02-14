//
//  Request.swift
//  WykopLib
//
//  Created by Bartłomiej Łaski on 14/02/2025.
//

import Foundation

protocol RequestType {
    associatedtype BodyValue: Codable

    var path: String { get }
    var method: RequestMethods { get }
    var queryItems: [URLQueryItem] { get }
    var body: BodyValue { get }
}

enum RequestMethods: String {
    case GET
    case POST
    case PUT
    case DELETE
}
