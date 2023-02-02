//
//  Question.swift
//  BoysVersusGirlsGame
//
//  Created by Алексей on 24.01.2023.
//

import Foundation

struct Question {
    let sex: Sex
    let image: String
    let title: String
    let answer: [Answer]
}

struct Answer {
    let title: String
    let correct: Bool
}

enum Sex {
    case male
    case female
}
