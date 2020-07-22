//
//  MemoryGame.swift
//  Memories
//
//  Created by LYC on 2020/6/11.
//  Copyright © 2020 龙泳潮. All rights reserved.
//

import Foundation

struct MemoryGame<CardContent> {
    var cards: Array<Card> // 申请Card的数组
    
    /* 用于测试触点卡片作出的反应 */
    func choose(card: Card) {
        print("card chosen: \(card)") // 打印卡片的信息
    }
    
    /* 初始化函数 */
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = Array<Card>() // 这个cards和上面声明的那个cards是同一个，只不过这里是让它成为空数组。
        
        for pairIndex in 0..<numberOfPairsOfCards { // 给每一张卡片初始化
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: pairIndex * 2))
            cards.append(Card(content: content, id: pairIndex * 2 + 1))
        }
        
        cards.shuffle() // 任务2:使用shuffle直接打乱卡牌顺序即可
    }
    
    /* 卡片结构体 */
    struct Card: Identifiable {
        var isFaceUp: Bool = true
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
    }
}


