//
//  ApiRequestBody.swift
//  WykopLib
//
//  Created by Bartłomiej Łaski on 15/02/2025.
//

import Foundation

struct ApiRequestBody<T: Encodable>: Encodable {
    let data: T
}
