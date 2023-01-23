//
//  UserSettings.swift
//  BoysVersusGirlsGame
//
//  Created by Алексей on 23.01.2023.
//

import Foundation


struct UserSetting {
    
    private enum SettingsKeys: String {
        case numberOfQuestion
        case timeForAnswer
    }
    
    static var numberOfQuestion: Float! {
        get {
            return UserDefaults.standard.float(forKey: SettingsKeys.numberOfQuestion.rawValue)
        } set {
            let defaultsNumber = UserDefaults.standard
            let keyNumber = SettingsKeys.numberOfQuestion.rawValue
            if let number = newValue {
                defaultsNumber.set(number, forKey: keyNumber)
            } else {
                defaultsNumber.removeObject(forKey: keyNumber)
            }
        }
    }
    
    static var timeForAnswer: Float! {
        get {
            return UserDefaults.standard.float(forKey: SettingsKeys.timeForAnswer.rawValue)
        } set {
            let defaultsTime = UserDefaults.standard
            let keyTime = SettingsKeys.timeForAnswer.rawValue
            if let time = newValue {
                defaultsTime.set(time, forKey: keyTime)
            } else {
                defaultsTime.removeObject(forKey: keyTime)
            }
        }
    }
}
