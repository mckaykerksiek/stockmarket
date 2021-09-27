//
//  GameView.swift
//  StockMarket
//
//  Created by McKay Michaelis on 9/6/21.
//

import SwiftUI

struct GameView: View {
    
    @EnvironmentObject var gvm: GameViewModel
    
    let diceData = (1...6).map { $0 }
    let diceColumns = [
           GridItem(.flexible()),
           GridItem(.flexible())]
    
    var playerColumns: [GridItem] =
    [GridItem(.flexible())]
    
    var body: some View {
        VStack(alignment: .center) {
            
            Divider()
            RoundInfoView(round: gvm.currentRound, numberOfRounds: gvm.numberOfRounds)
                .padding(.horizontal, 32.0)
                .frame(minHeight: 75)
            Divider()
            playerList()
                .padding(.horizontal)
            Spacer()
            dice()
            Spacer()
            
        }
        .padding(.vertical, 20.0)
    }
    
    @ViewBuilder func playerList() -> some View {
        ScrollView(.horizontal) {
            LazyHGrid(rows: playerColumns, spacing: 15) {
                ForEach(gvm.players, id: \.self.name) { player in
                    PlayerView(player: player, buttonCallback: gvm.goOut)
                }
            }
        }
    }
    
    @ViewBuilder func dice() -> some View {
        LazyVGrid(columns: diceColumns, spacing: 20) {
            ForEach(diceData, id: \.self) { dieNumber in
                Button(action: {
                    gvm.inputNumber(dieNumber: dieNumber)
                }, label: {
                    Image(systemName: "die.face.\(dieNumber)")
                        .resizable()
                        .frame(width: 75.0, height: 75.0)
                        .accentColor(.black)
                })
            }
        }
        .padding(.horizontal)
    }
    
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
            .environmentObject(GameViewModel())
    }
}
