//
//  Round.swift
//  StockMarket
//
//  Created by McKay Michaelis on 9/19/21.
//

import Foundation

class Round: ObservableObject {
    @Published var number: Int
    @Published var score: Int = 0
    @Published var isCompleted: Bool = false
    
    
    init(number: Int) {
        self.number = number
    }
    
    func roll(die1: Int, die2: Int) {
        let dieTotal = die1 + die2
        
        // double score if doubles were rolled
        if (die1 == die2) && (score != 0) {
            score *= 2
            return
        }
        
        if score < 25 { //add score normally if score is < 25
            score += dieTotal
        } else {
            // if score is > 25 and roll was a 7, complete round
            if dieTotal == 7 {
                isCompleted = true
            } else {
                // otherwise, add score as normal
                score += dieTotal
            }
        }
    }
    
}
