//
//  QuestionManagrer.swift
//  BoysVersusGirlsGame
//
//  Created by Алексей on 27.01.2023.
//

import Foundation

class QuestionManager {
    static func getQuestions() -> [Question] {
        let quantity = Int(UserSetting.numberOfQuestion)
        var questions: [Question] = []
        if quantity <= QuestionStore().questions.count {
            for _ in 0..<quantity {
                if let question = QuestionStore().questions.randomElement() {
                    questions.append(question)
                }
            }
        }
        return questions
    }
}
