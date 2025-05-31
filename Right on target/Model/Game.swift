//
//  Game.swift
//  Right on target
//
//  Created by Sayat on 31.05.2025.
//

protocol GameProtokol {
    var score: Int { get }
    var currentSecretValue: Int { get }
    var IsGameEnded: Bool { get }
    
    func restartGame()
    func startNewRound()
    func calculateScore(with value: Int)
}


class Game: GameProtokol {
    var score: Int = 0
    private var minSecretValue: Int
    private var maxSecretValue: Int
    var currentSecretValue: Int = 0
    private var lastRound: Int = 0
    private var currentRound: Int = 1
    
    var IsGameEnded: Bool {
        if currentRound >= lastRound {
            return true
        } else {
            return false
        }
    }
    
    init?(startValue: Int, endValue: Int, rounds: Int) {
        guard startValue <= endValue else {
            return nil
        }
        minSecretValue = startValue
        maxSecretValue = endValue
        lastRound = rounds
        currentSecretValue = self.getNewSecretValue()
    }
    
    func restartGame() {
        score = 0
        currentRound = 0
        startNewRound()
    }
    func startNewRound() {
        currentSecretValue = self.getNewSecretValue()
        currentRound += 1
    }
    func getNewSecretValue() -> Int {
        (minSecretValue...maxSecretValue).randomElement()!
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
