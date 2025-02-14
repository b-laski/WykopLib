//
//  SurveyAnswer.swift
//  WykopLib
//
//  Created by Bartłomiej Łaski on 14/02/2025.
//

struct SurveyAnswer: Codable {
    let text: String
    let id: Int
    let count: Int
    let voted: Int
}
