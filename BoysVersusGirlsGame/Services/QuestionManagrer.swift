//
//  QuestionManagrer.swift
//  BoysVersusGirlsGame
//
//  Created by Алексей on 27.01.2023.
//

import Foundation

class QuestionManager {
        
    static func getGirlQuestions() -> [Question] {
        var questions: [Question] = []

        for question in QuestionStore().questions.shuffled() {
            if questions.count == Int(UserSetting.numberOfQuestion) {
                break
            }
            if question.sex == .female {
                questions.append(question)
            }
        }
        return questions
    }
    
    static func getBoysQuestions() -> [Question]{
        var questions: [Question] = []
        
        for question in QuestionStore().questions.shuffled() {
            if questions.count == Int(UserSetting.numberOfQuestion)  {
                break
            }
            if question.sex == .male {
                questions.append(question)
            }
        }
        return questions
    }
}
