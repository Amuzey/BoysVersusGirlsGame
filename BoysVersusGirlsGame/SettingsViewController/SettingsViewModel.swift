//
//  SettingsViewModel.swift
//  BoysVersusGirlsGame
//
//  Created by Клоун on 19.10.2022.
//

import Foundation

protocol SettingViewModelProtocol {
    func howManyQuestions(quantity: Int)
    func howManyTime(quantity: Int)
    
}

class SettingViewModel: SettingViewModelProtocol {
    func howManyQuestions(quantity: Int) {
        
    }
    
    func howManyTime(quantity: Int) {
        
    }
}



// метод принимает кол-во вопросов и обращается к менеджеру.
// questionAndMeneger - метод для взаимодействия с моделькой.  метод который формирует массив с вопросами. параметр sex
