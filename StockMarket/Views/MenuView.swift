//
//  MenuView.swift
//  StockMarket
//
//  Created by McKay Michaelis on 9/6/21.
//

import SwiftUI

struct MenuView: View {
    @EnvironmentObject var gvm: GameViewModel

    @State private var value = 10
        let step = 1
        let range = 1...50
    @State private var playerName = ""
    @State private var isEditing = false
    @State private var showError = false
    
    var rows: [GridItem] = [GridItem(.adaptive(minimum: 80))]

    var body: some View {
        VStack(spacing: 40.0) {
           Spacer()
            HStack {
                Text("Rounds: ")
                    .padding(.leading)
                Stepper(value: $gvm.numberOfRounds,
                        in: range,
                        step: step)
                {
                    Text("\(gvm.numberOfRounds)")
                        .font(.title)
                        .multilineTextAlignment(.trailing)
                        .padding(.leading, 50.0)
                }
                .padding(.trailing, 20.0)
            }
            
            HStack {
                Text("Players: ")
                    .multilineTextAlignment(.center)
                    .padding(.leading)
                TextField(
                       "player name",
                        text: $playerName
                   )
                { isEditing in
                       self.isEditing = isEditing
                        //showError = false
                   }
                onCommit: {
                        if gvm.isValidPlayerName(name: playerName) {
                            gvm.addPlayerString(name: playerName)
                            playerName = ""
                            showError = false
                        } else {
                            showError = true
                        }
                   }
                   .autocapitalization(.none)
                   .disableAutocorrection(true)
                   .border(Color(UIColor.separator))
                Button(action: {
                    if gvm.isValidPlayerName(name: playerName) {
                        gvm.addPlayerString(name: playerName)
                        playerName = ""
                        showError = false
                    } else {
                        showError = true
                    }
                }, label: {
                    Image(systemName: "plus.circle")
                        .resizable()
                        .frame(width: 30.0, height: 30.0)
                })
            }
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding(.trailing)
            if showError {
                Text("Invalid player name!")
                    .foregroundColor(Color.red)
                    .frame(height: 20)
            } else {
                Text("")
                    .frame(height:20)
            }
            playerList()
            
            startButton()
        }
        .padding(.bottom, 50.0)
        .navigationBarTitle(Text("Menu"), displayMode: .inline)

    }
    
    @ViewBuilder func startButton() -> some View {
        Button(action: {
            gvm.startGame()
            gvm.inGame = true
            
        }, label: {
            Text("Start Game")
        })
        .buttonStyle(PlainButtonStyle())
        .foregroundColor(.white)
        .padding()
        .background(Color.blue)
        .cornerRadius(8)
    }
    
    @ViewBuilder func playerList() -> some View {
        ScrollView {
            LazyVGrid(columns: rows) {
                ForEach(gvm.playersString, id: \.self) { player in
                        HStack {
                            Text(player)
                            Button(action: {
                                let index = gvm.playersString.firstIndex(of: player)!
                                gvm.playersString.remove(at: index)
                            }, label: {
                                Image(systemName: "xmark.circle")
                            })
                        }
                    }
            }
            .padding(.horizontal)
        }
        .frame(height: .infinity)
    }
    
}


struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MenuView()
                .environmentObject(GameViewModel())
        }
    }
}
