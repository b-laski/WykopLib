//
//  URLRequestBuilder.swift
//  WykopLib
//
//  Created by Bartłomiej Łaski on 15/02/2025.
//

import Foundation

struct URLRequestBuilder {
    let baseURL: URL
    var components: URLComponents
    var request: URLRequest

    init(baseURL: URL) {
        self.baseURL = baseURL
        self.components = URLComponents(url: baseURL, resolvingAgainstBaseURL: false)!
        self.request = URLRequest(url: baseURL)
    }

    func setPath(_ path: String) -> URLRequestBuilder {
        var builder = self
        builder.components.path = baseURL.appendingPathComponent(path).path
        return builder
    }

    func setQueryItems(_ queryItems: [URLQueryItem]) -> URLRequestBuilder {
        var builder = self
        if !queryItems.isEmpty {
            builder.components.queryItems = queryItems
        }
        return builder
    }

    func setMethod(_ method: RequestMethod) -> URLRequestBuilder {
        var builder = self
        builder.request.httpMethod = method.rawValue
        return builder
    }

    func setBody<T: Codable>(_ body: T) throws -> URLRequestBuilder {
        var builder = self
        builder.request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        builder.request.httpBody = try JSONEncoder().encode(body)
        return builder
    }

    func build() throws -> URLRequest {
        guard let url = components.url else {
            throw URLError(.badURL)
        }
        var builtRequest = request
        builtRequest.url = url
        return builtRequest
    }
}
