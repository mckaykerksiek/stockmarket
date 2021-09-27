//
//  GameViewModel.swift
//  StockMarket
//
//  Created by McKay Michaelis on 9/6/21.
//

import Foundation

class GameViewModel: ObservableObject {
    @Published var inGame: Bool = false

    @Published var numberOfRounds: Int = 10
    @Published var playersString: [String] = ["mckay", "jacob"]
    @Published var players: [Player] = [Player(name: "mckay"), Player(name: "lee"), Player(name: "jacob"), Player(name: "kathie"), Player(name: "Tyler"), Player(name: "Ethan"), Player(name: "Sarah")]
    
    @Published var currentRound: Round = Round(number: -1)
    @Published var rounds: [Round] = []
    @Published var gameOver: Bool = false
    var selectedDice: [Int] = []
    var playerCount = 0
    var playersOut: Int = 0
    var sortedPlayers: [Player] {
        return players.sorted {
            $0.totalScore > $1.totalScore
        }
    }
    
    func isValidPlayerName(name: String) -> Bool {
        // valid if it is not empty and not taken already
        if (name != "") && (!playersString.contains(name)) {
            return true
        }
        return false
    }
    
    func addPlayerString(name: String) {
        playersString.append(name)
    }
    
    func startGame() {
        createPlayers()
        createRounds()
        playerCount = players.count
        resetGame()
    }
    
    func createPlayers() {
        players = []
        for player in playersString {
            players.append(Player(name: player))
        }
    }
    
    func createRounds() {
        rounds = []
        for i in Range(0...numberOfRounds) {
            rounds.append(Round(number: i))
        }
        currentRound = rounds[0]
    }
    
    func inputNumber(dieNumber: Int) {
        selectedDice.append(dieNumber)
        if selectedDice.count == 2 {
            roll(die1: selectedDice[0], die2: selectedDice[1])
            selectedDice = []
        }
    }
    
    func roll(die1: Int, die2: Int) {
        // add the roll to the current round
        currentRound.roll(die1: die1, die2: die2)
        if currentRound.isCompleted {
            nextRound()
        }
    }
    
    func nextRound() {
        let nextRoundIndex = currentRound.number + 1
        if nextRoundIndex < numberOfRounds {
            currentRound = rounds[nextRoundIndex]
            resetPlayerStatus()
        } else {
            endGame()
        }
    }
    
    func resetPlayerStatus() {
        for player in players {
            player.isOut = false
        }
        playersOut = 0
    }
    
    func goOut(player: Player) {
        if currentRound.score >= 25 {
            player.goOut(score: currentRound.score)
            player.isOut = true
            playersOut += 1
            if playersOut == playerCount {
                nextRound()
            }
        }
    }
    
    func endGame() {
        gameOver = true
    }
    
    func resetGame() {
        resetPlayers()
        resetRounds()
        gameOver = false
        selectedDice = []
        
    }
    
    func resetRounds() {
        createRounds()
    }
    
    func resetPlayers() {
        for player in players {
            player.reset()
        }
        playersOut = 0
    }
    
    func exitGame() {
        resetGame()
        inGame = false
    }
}
