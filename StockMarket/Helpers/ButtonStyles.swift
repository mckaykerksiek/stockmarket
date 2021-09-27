//
//  ButtonStyles.swift
//  StockMarket
//
//  Created by McKay Michaelis on 9/6/21.
//

import Foundation
import SwiftUI

struct RoundedRectangleButtonStyle: ButtonStyle {
  func makeBody(configuration: Configuration) -> some View {
    HStack {
      Spacer()
      configuration.label.foregroundColor(.black)
      Spacer()
    }
    .padding()
    .background(Color.yellow.cornerRadius(8))
    .scaleEffect(configuration.isPressed ? 0.95 : 1)
  }
}
