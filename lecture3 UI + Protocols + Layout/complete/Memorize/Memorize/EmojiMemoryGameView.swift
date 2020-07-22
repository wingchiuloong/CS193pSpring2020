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
        HStack() { // 里面的内容水平摆放,HStack(spacing: 10)可以这样设置参数（设置里面内容相互间的距离）
            ForEach(viewModel.cards) { card in // 循环四个卡片。 之所以可以直接使用viewModel.cards，与Identifiable有关
                CardView(card: card).onTapGesture {
                    self.viewModel.choose(card: card) // 点触卡片作出的反应
                }
            }
        }
            .padding() // 设置距离外界的距离
            .foregroundColor(.orange)
            
        
        
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    
    var body: some View {
        GeometryReader { geomotry in // 把外框的参数读下来？
            self.body(for: geomotry.size)
        }
    }
    
    func body(for size: CGSize) -> some View {
        ZStack() { // ZStack是多个view重叠
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white) // 背景填充框
                RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: edgeLineWidth) // 返回该形状的描边
                Text(self.card.content)
            } else {
                RoundedRectangle(cornerRadius: cornerRadius).fill(Color.orange) // 背景填充框
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
