//
//  PlayerView.swift
//  StockMarket
//
//  Created by McKay Michaelis on 9/20/21.
//

import SwiftUI

struct PlayerView: View {
    @ObservedObject var player: Player
    var buttonCallback: (Player) -> ()
    
    var body: some View {
        if player.isOut {
            VStack {
                Text(" \(player.name)\n\(player.roundScores.last ?? 0)")
                    .foregroundColor(Color.gray)
                    .multilineTextAlignment(.center)
            }
        } else {
            Button(action: {
                buttonCallback(player)
            }, label: {
                Image(systemName: "lock")
                    .resizable()
                    .frame(width: 18, height: 20)
                Text(player.name)
                    .font(.title3)
                    .lineLimit(0)
                
            })
            .padding(10)
            .foregroundColor(.blue)
            .cornerRadius(50)
            .overlay(
                RoundedRectangle(cornerRadius: 40)
                    .stroke(Color.blue, lineWidth: 2)
            )
            
        }
    }
}

struct PlayerView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerView(player: Player(name: "mckay"), buttonCallback: { player in })
    }
}
