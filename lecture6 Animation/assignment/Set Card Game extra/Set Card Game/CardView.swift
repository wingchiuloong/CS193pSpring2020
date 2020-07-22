//
//  CardView.swift
//  Set Card Game
//
//  Created by 龙泳潮 on 2020/7/11.
//  Copyright © 2020 龙泳潮. All rights reserved.
//

import SwiftUI

struct CardView: View {
    @ObservedObject var viewModel: SetGame
    let card: SetGameModel.Card
    
    var body: some View {
        GeometryReader { geometry in
            self.cardView(size: geometry.size)
        }
    }
    
    private func cardView(size: CGSize) -> some View {
        let strokeLine = min(size.height, size.width) / 30
        let patternSize: CGSize = CGSize(width: size.width * 0.75, height: size.height * 0.75)
        let cornerRadius: CGFloat = min(size.height, size.width) / 10
        return ZStack {
            RoundedRectangle(cornerRadius: cornerRadius) // 被选与否背板
                .fill(Color.black)
                .opacity(card.isChosen ? 0 : 1)
            
            VStack {
                if card.feature1 == 1 {
                    if card.feature3 == 1 {
                        PickShape(whichShape: card.feature4, isShading: false).frame(width: patternSize.width, height: patternSize.height / 2.5, alignment: .center)
                    } else if card.feature3 == 2 {
                        PickShape(whichShape: card.feature4, isShading: true).stroke(lineWidth: strokeLine).frame(width: patternSize.width, height: patternSize.height / 2.5, alignment: .center)
                    } else {
                        PickShape(whichShape: card.feature4, isShading: false).stroke(lineWidth: strokeLine).frame(width: patternSize.width, height: patternSize.height / 2.5, alignment: .center)
                    }
                }
                else if card.feature1 == 2 {
                    if card.feature3 == 1 {
                        PickShape(whichShape: card.feature4, isShading: false)
                        PickShape(whichShape: card.feature4, isShading: false)
                    } else if card.feature3 == 2 {
                        PickShape(whichShape: card.feature4, isShading: true).stroke(lineWidth: strokeLine)
                        PickShape(whichShape: card.feature4, isShading: true).stroke(lineWidth: strokeLine)
                    } else {
                        PickShape(whichShape: card.feature4, isShading: false).stroke(lineWidth: strokeLine)
                        PickShape(whichShape: card.feature4, isShading: false).stroke(lineWidth: strokeLine)
                    }
                }
                else {
                    if card.feature3 == 1 {
                        PickShape(whichShape: card.feature4, isShading: false)
                        PickShape(whichShape: card.feature4, isShading: false)
                        PickShape(whichShape: card.feature4, isShading: false)
                    } else if card.feature3 == 2 {
                        PickShape(whichShape: card.feature4, isShading: true).stroke(lineWidth: strokeLine)
                        PickShape(whichShape: card.feature4, isShading: true).stroke(lineWidth: strokeLine)
                        PickShape(whichShape: card.feature4, isShading: true).stroke(lineWidth: strokeLine)
                    } else {
                        PickShape(whichShape: card.feature4, isShading: false).stroke(lineWidth: strokeLine)
                        PickShape(whichShape: card.feature4, isShading: false).stroke(lineWidth: strokeLine)
                        PickShape(whichShape: card.feature4, isShading: false).stroke(lineWidth: strokeLine)
                    }
                }
            }
                .frame(width: patternSize.width, height: patternSize.height, alignment: .center)
                
        }.foregroundColor(card.feature2 == 1 ? .red : (card.feature2 == 2 ? .green : .purple))
    }
}
