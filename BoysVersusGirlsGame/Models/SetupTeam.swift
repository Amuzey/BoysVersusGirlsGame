//
//  SetupTeam.swift
//  BoysVersusGirlsGame
//
//  Created by Алексей on 23.01.2023.
//

import Foundation

class SetupTeam {
    
    static let shared = SetupTeam()
    
    var girlsName: String?
    var boysName: String?
    var isGirl: Bool? = true
    var girlsAnswerCorrectCount: Int = 0
    var boysAnswerCorrectCount: Int = 0
    
    init(girlsName: String?, boysName: String?, isGirl: Bool?) {
        self.girlsName = girlsName
        self.boysName = boysName
        self.isGirl = isGirl
    }
    
    private init() {}
    
    func addGirl(name: String) {
        girlsName = name
    }
    
    func addBoy(name: String) {
        boysName = name
    }
    
    func isGirlToggle() {
        isGirl?.toggle()
    }
    
    func addCorrectAnswerGirls() {
        girlsAnswerCorrectCount += 1
    }
    
    func addCorrectAnswerBoys() {
        boysAnswerCorrectCount += 1
    }
    
    func resetAll() {
        girlsName = nil
        boysName = nil
        isGirl = true
        girlsAnswerCorrectCount = 0
        boysAnswerCorrectCount = 0
    }
}
