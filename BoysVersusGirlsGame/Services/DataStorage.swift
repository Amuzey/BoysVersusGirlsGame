//
//  DataStorage.swift
//  BoysVersusGirlsGame
//
//  Created by Клоун on 20.10.2022.
//

import Foundation

class DataStorage {
    static let shared = DataStorage()
    
    let rules = """
        В нашем мире не редко возникали споры между мужчиной и женщиной.
        Кто умнее? Кто мыслит более логично?
        Говорят, что женщины обладают искусством "Женской логики" и способны знать правильный ответ основываясь на собственнные чувства.
        Говорят, что мужчины более рассудительны, и могут выстроить логическую цепочку для получения правильного ответа.
        Давайте поставим точку в этом вечном споре, и ответим на главный вопрос. Кто умнее, мужчины или женщины?
        
        BoysVersusGirls, это веселая, интелектуальная игра, в которой необходимо отвечать на интересные вопросы.
        Компания делится на две команды: Мужчины и Женщины
        Мужчинам придеться отвечать на вопросы связаные с косметикой, одеждой или рецептами разных блюд.
        Женщины же наоборот будут отвечать на вопросы об автомобилях, футболе и пиве)
        Побеждает команда набравшая наибольшее количество правильных ответов!
        
        Ну что, ПОЕХАЛИ!!!
        """
    
    var girlsTeamName: String?
    var boysTeamName: String?
    
    private init () {}
}
