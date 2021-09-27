//
//  Player.swift
//  StockMarket
//
//  Created by McKay Michaelis on 9/19/21.
//

import Foundation

class Player: ObservableObject, Identifiable {
    
    @Published var name: String
    @Published var roundScores: [Int] = []
    @Published var isOut: Bool = false
    let id = UUID()
    
    var totalScore: Int {
        return roundScores.reduce(0, +)
    }
    
    init(name: String) {
        self.name = name
    }
    
    func reset() {
        roundScores = []
        isOut = false
    }
    
    func goOut(score: Int) {
        roundScores.append(score)
        isOut = true
    }
    
}
