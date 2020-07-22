//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by 龙泳潮 on 2020/6/16.
//  Copyright © 2020 龙泳潮. All rights reserved.
//
// This is view of MVVM

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        
        VStack {
            Text(viewModel.theme.name)
                .font(.title)
                .bold()
                .padding([.top, .leading, .trailing])
                .foregroundColor(viewModel.theme.color)
            Divider()
            Grid(viewModel.cards) { card in
                CardView(card: card, theme: self.viewModel.theme).onTapGesture {
                    self.viewModel.choose(card: card)
                }
                    .padding(5)
            }
                .padding()
                .foregroundColor(viewModel.theme.color)
            
            Divider()
            HStack() {
                Spacer()
                Image(systemName: "repeat")
                    .padding(.vertical)
                    .scaleEffect(2)
                    
                    .onTapGesture {
                        self.viewModel.model =  EmojiMemoryGame.createMemeoryGame()
                }
                Spacer()
                Text("目前得分:\(viewModel.score)")
                Spacer()
            }
                .foregroundColor(viewModel.theme.color)
                .padding(.bottom)
        }
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    var theme: Theme
    
    var body: some View {
        GeometryReader { geomotry in
            self.body(for: geomotry.size)
        }
    }
    
    func body(for size: CGSize) -> some View {
        ZStack() {
            if card.isFaceUp { // 卡片面朝上，显示矩形框框具体的Emoji
                RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
                RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: edgeLineWidth)
                Text(self.card.content)
            } else {
                if !card.isMatched{ // 没有被匹配就显示纯色的背面
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .fill(LinearGradient(gradient: Gradient(colors: [theme.color, .white]), startPoint: .topLeading, endPoint: .bottomTrailing))
                }
            }
        }
            .font(Font.system(size: fontSize(for: size)))
    }
    
    // MARK: - Drawing Constants
    
    let cornerRadius: CGFloat = 10.0
    let edgeLineWidth: CGFloat = 3
    func fontSize(for size: CGSize) -> CGFloat {
        min(size.width, size.height) * 0.75
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(viewModel: EmojiMemoryGame())
    }
}
