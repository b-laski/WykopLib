//
//  Survey.swift
//  WykopLib
//
//  Created by Bartłomiej Łaski on 14/02/2025.
//

struct Survey: Codable {
    let key: String
    let question: String
    let voted: Int
    let count: Int
    let answers: [SurveyAnswer]
    let actions: SurveyActions
}
