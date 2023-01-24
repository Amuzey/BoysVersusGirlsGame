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
    
    static func getQuestions() -> [Question] {
        
        [Question(sex: .female,
                  image: "fly",
                  title: "Зачем педали самолету?",
                  answer: [Answer(title: "Управлять хвостом", correct: true),
                           Answer(title: "Набирать скорость", correct: false),
                           Answer(title: "Заряжать аккумулятор", correct: false)])]
    }
}

struct Answer {
    let title: String
    let correct: Bool
}

enum Sex {
    case male
    case female
}
