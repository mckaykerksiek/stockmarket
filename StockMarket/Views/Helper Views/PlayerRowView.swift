//
//  PlayerRowView.swift
//  StockMarket
//
//  Created by McKay Michaelis on 9/21/21.
//

import SwiftUI

struct PlayerRowView: View {
    @ObservedObject var player: Player
    var place: Int
    var body: some View {
        if place == 1 {
            placeView()
                .frame(maxWidth: .infinity)
                .font(.title)
        } else {
            placeView()
        }
    }
    
    @ViewBuilder func placeView() -> some View {
        HStack {
            Text("\(place)")
                .multilineTextAlignment(.leading)
                .frame(width: 50)
            Text(player.name)
                .multilineTextAlignment(.leading)
            Spacer()
            Text("\(player.totalScore)")
                .multilineTextAlignment(.center)
                .frame(minWidth: 50)
        }
    }
}

struct PlayerRowView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerRowView(player: Player(name: "mckay"), place: 1)
    }
}
