//
//  ContentView.swift
//  Memories
//
//  Created by 龙泳潮 on 2020/6/7.
//  Copyright © 2020 龙泳潮. All rights reserved.
//

import SwiftUI

struct ContentView: View { //可以理解为ContentView表现得像View。这里还是函数编程，而不是面向对象编程。
    var viewModel: EmojiMemoryGame // 整个view-model作为参数。
    
    var body: some View {
//        let cardsNumber = viewModel.cards.count
        
        HStack { // 里面的内容水平排列
            ForEach(viewModel.cards) { card in // ForEach里面 有个参数是id。且viewModel.cards是数组，card是元素
                CardView(card: card).onTapGesture {
                    self.viewModel.choose(card: card)
                }
                    .aspectRatio(2/3, contentMode: .fill) // 设置每张卡片的宽长比为2:3，任务3
            }
            
        }
            .scaledToFit() // 缩放到适合父视图的大小，任务3
            .padding()
            .foregroundColor(Color.orange)
            .font(self.viewModel.cards.count != 10 ? .largeTitle : .body) // 任务5
    }
}

struct CardView: View { // 单个卡片的显示，遵守协议view是能在UI上显示必须的。
    var card: MemoryGame<String>.Card // model的卡片变量
    var body: some View {
        ZStack {
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: 10.0).fill(Color.white) // 圆角矩形，用白色填充
                RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 3) // 圆角矩形边框，线宽为3
                Text(card.content) // 显示文字
            } else {
                RoundedRectangle(cornerRadius: 10.0).fill(Color.white) // 圆角矩阵，用白色填充
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: EmojiMemoryGame())
    }
}
 
