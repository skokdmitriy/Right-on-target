//
//  GameRound.swift
//  Right on target
//
//  Created by Дмитрий Скок on 02.05.2022.
//

import Foundation

protocol GameRoundProtocol {
    // Количество заработанных очков
    var score: Int { get }
    // Загаданное число
    var currentSecretValue: Int { get }
    //    подсчет количества очков
    func calculateScore(with value: Int)
}

class GameRound: GameRoundProtocol {
    var score: Int = 0
    var currentSecretValue: Int = 0
    init(secretValue: Int) {
        currentSecretValue = secretValue
    }
    
    func calculateScore(with value: Int) {
        if value > currentSecretValue {
            score += 50 - value + currentSecretValue
        } else if value < currentSecretValue {
            score += 50 - currentSecretValue + value
        } else {
            score += 50
        }
    }
}
