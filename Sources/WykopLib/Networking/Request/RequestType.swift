//
//  Request.swift
//  WykopLib
//
//  Created by Bartłomiej Łaski on 14/02/2025.
//

import Foundation

protocol RequestType {
    associatedtype BodyValue: Codable
    associatedtype Response = Codable.Type

    var path: String { get }
    var method: RequestMethod { get }
    var queryItems: [URLQueryItem] { get }
    var header: [String: Any] { get }
    var body: BodyValue? { get }
    var responseType: Response.Type { get }
}
