// 97
//  Game.swift
//  Right on target
//
//  Created by Дмитрий Скок on 27.04.2022.
//

import Foundation

protocol GameProtocol{
// Количество заработанных очков
    var score: Int { get }
// Загаданное число
    var currentRound: GameRoundProtocol! { get }
//    Генератор случайного значения
    var secretValueGenerator: GeneratorProtocol { get }
// Проверка окончания игры
    var isGameEnded: Bool { get }
// Начать новую игру
    func restartGame()
// Начать новый раунд
    func startNewRound ()
}

class Game: GameProtocol {
    var score: Int {
        var totalScore: Int = 0
        for round in self.rounds {
            totalScore += round.score
        }
        return totalScore
    }
    
    var currentRound: GameRoundProtocol!
    private var rounds: [GameRoundProtocol] = []
    var secretValueGenerator: GeneratorProtocol
    private var roundsCount: Int!
    var isGameEnded: Bool {
        if roundsCount == rounds.count {
            return true
        } else {
            return false
        }
    }
    
    init(valueGenerator: GeneratorProtocol, rounds: Int) {
        secretValueGenerator = valueGenerator
        roundsCount = rounds
        startNewRound()
    }
    
    func restartGame() {
        rounds = []
        startNewRound()
    }
    
    func startNewRound() {
        let newSecretValue = self.getNewSecretValue()
        currentRound = GameRound(secretValue: newSecretValue)
        rounds.append(currentRound)
    }
    private func getNewSecretValue() -> Int {
        return secretValueGenerator.getRandomValue()
    }
    
}
