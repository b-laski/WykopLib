//
//  ApiResponse.swift
//  WykopLib
//
//  Created by Bartłomiej Łaski on 15/02/2025.
//

import Foundation

enum ApiResponse<T: Codable>: Codable {
    case success(T)
    case error(ApiClientError)
}
