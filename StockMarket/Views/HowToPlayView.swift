//
//  HowToPlayView.swift
//  StockMarket
//
//  Created by McKay Michaelis on 9/21/21.
//

import SwiftUI

struct HowToPlayView: View {
    var body: some View {
        ScrollView(.vertical) {
            heading()
            gameRules()
            usingTheApp()
        }
        .padding(.all)
        .navigationBarTitle(Text("Stock Market"), displayMode: .inline)

    }
    
    @ViewBuilder func usingTheApp() -> some View {
        Text("Using the App")
            .font(.title)
            .fontWeight(.semibold)
        subtitleLeft(text: "Set-up:")
        Text("\tUse the +/- buttons to choose the number of rounds. Add each player's name using the plus button or by pressing enter. Player names must be unique.")
            .padding(.leading)
        subtitleLeft(text: "In Game:")
        Text("\tAfter the physical dice are rolled, tap the two corresponding die pictures. For example, if a 2 and 5 are rolled, tap the 2 die and the 5 die. This will add 7 points to the score.\n\tWhen a player wants to go out, tap their name. They will be out and the current score will be added to their total points. The rounds will automatically end when a 7 is rolled, or all players are out. The game will automatically end when all rounds have been played.")
            .padding(.leading)

    }
    
    @ViewBuilder func gameRules() -> some View {
        Text("Game Rules")
            .font(.title)
            .fontWeight(.semibold)
        subtitleLeft(text: "Set-up:")
        Text("\tYou will need 2 dice, and all players sitting in a circle.")
            .padding(.leading)
        subtitleLeft(text: "Game Play:")
        Text("\tThe objective of the game is to gain the most points by \"bidding\" on the stock market. The game is divided into rounds, and players will have a chance each round to earn points.\n\tEach round, players will take turns rolling the dice. The numbers that are rolled will add to the round's total score, which starts at zero at the beginning of each round. \n\tAfter each roll, players have the opportunity to \"go out\". When a player chooses to go out, they add the current amount of points to their total score. Players can only go out once per round. If a player does not go out before the round ends, their score for the round is 0.\n\tA player cannot go out until the score for the round is 25 or higher, which is when the stock market is considered \"live\". A round ends when each player has gone out, or the stock market is live and a 7 has been rolled. If the latter happens, players that have not gone out yet have lost their chance, and get 0 points for the round.")
            .multilineTextAlignment(.leading)
            .padding(.leading)
        subtitleLeft(text: "Scoring:")
        Text("\tWhile the stock market is not live, the sum of the dice is added numerically, except for when the dice are the same (doubles), which doubles the points. If a the dice total 7 before the stock market is live, the round does not end, and the points are added as normal.\n\tOnce the stock market is live, points are added the same as before, except for if a 7 is rolled. Once a 7 is rolled, the round is over and the score resets to 0 for the next round.\n\tFor example: A 6 and a 5 are rolled, so 11 points are added to the round's score. Then, 3 and a 3 are then rolled, so the score is doubled, going to 22. Next, a 5 and a 2 are rolled. This makes 7, but because the market isn't live yet, it is added as normal, making the score 29. The stock market is now a live. A 2 and a 2 are rolled, doubling the score to 58. Then, a 6 and a 1 are rolled, making 7, so the round is over.")
            .multilineTextAlignment(.leading)
            .padding(.leading)
    }
    
    @ViewBuilder func heading() -> some View {
        Text("Stock Market")
            .font(.system(size: 50))
        Text("\"How to Play\"")
            .font(.title3)
            .foregroundColor(Color.gray)
        HStack {
            Image(systemName: "die.face.2")
                .resizable()
                .frame(width: 35, height: 35)
            Image(systemName: "die.face.5")
                .resizable()
                .frame(width: 35, height: 35)
        }
        Divider()
        Text("Stock Market is a multiplayer game played with 2 dice. This app is meant to be a scorekeeper for the physical game, so 2 physical dice will still be required.")
        Divider()
    }
    
    @ViewBuilder func titleLeft(text: String) -> some View {
        HStack {
            Text(text)
                .font(.title)
                .fontWeight(.semibold)
                .multilineTextAlignment(.leading)
            Spacer()
        }
    }
    
    @ViewBuilder func subtitleLeft(text: String) -> some View {
        HStack {
            Text(text)
                .font(.title2)
                .fontWeight(.medium)
                .multilineTextAlignment(.leading)
            Spacer()
        }
    }

}

struct HowToPlayView_Previews: PreviewProvider {
    static var previews: some View {
        HowToPlayView()
    }
}
