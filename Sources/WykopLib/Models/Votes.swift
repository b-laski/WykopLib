//
//  Votes 2.swift
//  WykopLib
//
//  Created by Bartłomiej Łaski on 14/02/2025.
//

struct Votes: Codable {
    let up: Int
    let down: Int
    let users: [Author]
}
