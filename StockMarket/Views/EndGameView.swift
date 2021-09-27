//
//  EndGameView.swift
//  StockMarket
//
//  Created by McKay Michaelis on 9/20/21.
//

import SwiftUI

struct EndGameView: View {
    
    @EnvironmentObject var gvm: GameViewModel
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button(action: {
                    gvm.exitGame()
                }, label: {
                    Image(systemName: "xmark.circle")
                        .resizable()
                        .frame(width: 25, height: 25)
                        .accentColor(.red)
                })
            }
            Text("Results")
                .font(.largeTitle)
            List(gvm.sortedPlayers) { player in
                let index = gvm.sortedPlayers.firstIndex(where: { $0.id == player.id })!
                PlayerRowView(player: player, place: index + 1)
            }
            Button(action: {
                gvm.resetGame()
            }, label: {
                Text("Play Again")
            })
            .padding()
            .buttonStyle(PlainButtonStyle())
            .foregroundColor(.white)
            .background(Color.green)
            .cornerRadius(8)
        }
        .padding([.leading, .trailing], 15.0)
        .padding([.bottom], 50)
    }
}

struct EndGameView_Previews: PreviewProvider {
    static var previews: some View {
        EndGameView()
            .environmentObject(GameViewModel())
    }
}
