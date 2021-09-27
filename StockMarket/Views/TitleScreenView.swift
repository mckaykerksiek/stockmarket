//
//  TitleScreenView.swift
//  StockMarket
//
//  Created by McKay Michaelis on 9/6/21.
//

import SwiftUI

struct TitleScreenView: View {
    @EnvironmentObject var gvm: GameViewModel
    
    var body: some View {
        NavigationView {
            VStack(spacing: 50.0) {
                Spacer()
                Text("Stock Market")
                    .font(.largeTitle)
                    .fontWeight(.light)
                HStack{
                    Image(systemName: "die.face.5.fill")
                        .resizable()
                        .frame(width: 50.0, height: 50.0)
                    Image(systemName: "die.face.2.fill")
                        .resizable()
                        .frame(width: 50.0, height: 50.0)
                }
                startButton()
                Spacer()
                howToPlayButton()
            }
            .padding(.vertical, 50.0)
            .navigationBarTitle("")
            .navigationBarHidden(true)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
    @ViewBuilder func howToPlayButton() -> some View {
        NavigationLink(destination: HowToPlayView()) {
            Text("How To Play")
                .font(.callout)
        }
    }
    
    @ViewBuilder func startButton() -> some View {
        NavigationLink(destination: MenuView().environmentObject(gvm)) {
            Text("Start Game")
        }
        .buttonStyle(PlainButtonStyle())
        .foregroundColor(.white)
        .padding()
        .background(Color.blue)
        .cornerRadius(8)
    }
}

struct TitleScreenView_Previews: PreviewProvider {
    static var previews: some View {
        TitleScreenView()
            .environmentObject(GameViewModel())
    }
}
