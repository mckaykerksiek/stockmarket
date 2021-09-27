//
//  RoundInfoView.swift
//  StockMarket
//
//  Created by McKay Michaelis on 9/20/21.
//

import SwiftUI

struct RoundInfoView: View {
    
    @ObservedObject var round: Round
    var numberOfRounds: Int
    
    var body: some View {
        HStack(alignment: .center, spacing: 5) {
            if round.score < 25 {
                Text("NOT LIVE")
                    .foregroundColor(Color.red)
                    //.frame(maxWidth: .infinity)
            } else {
                Text("LIVE!")
                    .foregroundColor(Color.green)
                    //.frame(maxWidth: .infinity)
            }
            Text("\(round.score)")
                .font(.system(size: 50))
                .lineLimit(1)
                .frame(maxWidth: .infinity)
                .minimumScaleFactor(0.2)
            Text("Round \n \(round.number + 1)/\(numberOfRounds)")
                .multilineTextAlignment(.center)
                //.frame(maxWidth: .infinity)
        }
    }
}

struct RoundInfoView_Previews: PreviewProvider {
    static var previews: some View {
        RoundInfoView(round: Round(number: 1), numberOfRounds: 10)
    }
}
