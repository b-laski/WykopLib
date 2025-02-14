//
//  Color.swift
//  WykopLib
//
//  Created by Bartłomiej Łaski on 14/02/2025.
//

struct Color: Codable {
    let name: String
    let hex: String
    let hexDark: String

    enum CodingKeys: String, CodingKey {
        case name, hex
        case hexDark = "hex_dark"
    }
}
