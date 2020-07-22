//
//  ContentView.swift
//  Memorize
//
//  Created by 龙泳潮 on 2020/6/16.
//  Copyright © 2020 龙泳潮. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let str = "long yong chao"
    var body: some View {
        HStack() { // 里面的内容水平摆放,HStack(spacing: 10)可以这样设置参数（设置里面内容相互间的距离）
            ForEach(0..<4) { index in // 循环四个卡片
                CardView(isFaceUp: false)
            }
        }
            .padding() // 设置距离外界的距离
            .foregroundColor(.orange)
            .font(Font.system(size: 50))
        
        
    }
}

struct CardView: View {
    var isFaceUp: Bool
    var body: some View {
        ZStack() { // ZStack是多个view重叠
            if isFaceUp {
                RoundedRectangle(cornerRadius: 10.0).fill(Color.white) // 背景填充框
                RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 3) // 返回该形状的描边
                Text("🤖")
            } else {
                RoundedRectangle(cornerRadius: 10.0).fill(Color.orange) // 背景填充框
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
