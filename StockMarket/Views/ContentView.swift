//
//  ContentView.swift
//  StockMarket
//
//  Created by McKay Michaelis on 9/6/21.
//

import SwiftUI

struct ContentView: View {
    @StateObject var gvm = GameViewModel()

    var body: some View {
        if gvm.inGame {
            if gvm.gameOver {
                EndGameView()
                    .environmentObject(gvm)
            } else {
                GameView()
                    .environmentObject(gvm)
            }
        } else {
            TitleScreenView()
                .environmentObject(gvm)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
