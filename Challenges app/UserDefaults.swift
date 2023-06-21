//
//  BD.swift
//  Challenges app
//
//  Created by Bakhtovar Akhmedov on 17.06.2023.
//

import Foundation

class UserDefaultsData {
    static let userDefaults = UserDefaults.standard
    static var randomData = [
        RandomChallenge(string: "Крикни \"Привет\" на всю улицу"),
        RandomChallenge(string: "Не двигайся 5 минут"),
        RandomChallenge(string: "Скажи \"Я лох\" рядом с прохожим"),
        RandomChallenge(string: "Принимай контрастный душ в течение 30 дней подряд с условием того, что ты не пропускаешь дни"),
        RandomChallenge(string: "hi!!!"),
        RandomChallenge(string: "тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест"),
        RandomChallenge(string: "тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест"),
        RandomChallenge(string: "тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест"),
        RandomChallenge(string: "тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест тест")
    ]
    static func setRandomData() -> [RandomChallenge] {
        let indexs = UserDefaultsData.getData()
        var newData = [RandomChallenge]()
        for var (index, data) in randomData.enumerated() {
            if indexs.contains(index) {
                data.role = .on
                newData.append(data)
            } else {
                newData.append(data)
            }
        }
        randomData = newData
        return randomData
    }
    static func reloadData(newIndex: [Int]) {
        userDefaults.set(newIndex, forKey: "indexs")
    }
    static func getData() -> [Int] {
        if let data = userDefaults.object(forKey: "indexs") as? [Int] {
            return data
        }
        return [0]
    }
    
    static func getRandomData() -> [RandomChallenge] {
        var newData = [RandomChallenge]()
        
        for i in getData() {
            for var (index, data) in randomData.enumerated() {
                if index == i {
                    data.role = .on
                    newData.append(data)
                } else {
                    newData.append(data)
                }
            }
        }
        if newData.isEmpty {
            return randomData
        }
        randomData = newData
        
        return randomData
    }
    
    static func reloadRandomData(_ data: [RandomChallenge]) {
        randomData = data
    }
    
    static func setFavouriteData() -> [RandomChallenge] {
        let indexs = UserDefaultsData.getData()
        var newRealData = [RandomChallenge]()
        for var (index, data) in randomData.enumerated() {  //да костыль, но тут юзерДефаултс :)
            if indexs.contains(index) {
                data.role = .on
                newRealData.append(data)
            }
        }
        return newRealData
    }
}



