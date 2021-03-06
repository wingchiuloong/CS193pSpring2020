//
//  Bar.swift
//  Set Card Game
//
//  Created by 龙泳潮 on 2020/7/16.
//  Copyright © 2020 龙泳潮. All rights reserved.
//

import SwiftUI

struct BarView: View {
    @ObservedObject var viewModel: SetGame
    var player: Int
    init(viewModel: SetGame, player: Int) {
        self.viewModel = viewModel
        self.player = player
    }
   
    var body: some View {
        HStack {
           Button(action: {self.viewModel.resetNewGame()}) {
               Image(systemName: "arrow.2.circlepath")
           }
           
           ZStack {
               Image(systemName: "square.stack.3d.up")
               Text("\(viewModel.cardsOfPlayer[player].count)")
           }
           
           Text("\(viewModel.pointOfPlayer[player])")
           
           Button(action: {self.viewModel.deal()}) {
               ZStack {
                   Image(systemName: "square.stack").rotationEffect(Angle(degrees: 180))
                   Text("\(viewModel.cardsInDeck.count)").foregroundColor(.black).scaleEffect(0.6)
               }
           }
           
           Button(action: {}) {
               Image(systemName: "lightbulb")
           }
        }
    }
}
