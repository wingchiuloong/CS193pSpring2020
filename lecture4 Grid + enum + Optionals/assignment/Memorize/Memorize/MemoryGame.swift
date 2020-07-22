//
//  MemoryGame.swift
//  Memorize
//
//  Created by 龙泳潮 on 2020/6/16.
//  Copyright © 2020 龙泳潮. All rights reserved.
//

// This is model of MVVM

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    var cards: Array<Card>
    var theme: Theme
    var score: Int = 0
    
    var indexOfTheOneAndOnlyFaceUpCard: Int? { // 唯一面朝上卡片的索引
        get { cards.indices.filter { cards[$0].isFaceUp }.only } // get是调用（读）该变量时起作用
        set {                                                    // set是改变（写）该变量时起作用
            for index in cards.indices { // 若index不等于newValue，则把
                cards[index].isFaceUp = index == newValue
                if index != newValue { // 除了选中的那张卡，其它所有卡的beUpTime重新置空
                    cards[index].beUpTime = nil
                }
            }
        }
    }
    
    mutating func choose(card: Card) {
        if let chosenIndex = cards.firstIndex(matching: card),!cards[chosenIndex].isFaceUp, !cards[chosenIndex].isMatched { // 该卡是否存在，该卡是否面朝下，该卡是否还没有匹配，三个条件都符合则执行下面操作。
            if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard { // 若已有一张卡片被翻转时
                let interval = 0 - cards[potentialMatchIndex].beUpTime!.timeIntervalSince(Date())
                if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                    // 如果两张卡片的内容是相同时，则把这两张卡标记为已匹配
                    score += Int(max(10.0 - interval, 1.0) * 2.0)
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                    
                } else {
                    if cards[chosenIndex].hasUpAlready && cards[potentialMatchIndex].hasUpAlready {
                        score -= Int(min(interval, 10.0))
                    }
                }
                cards[chosenIndex].isFaceUp = true
            } else { // 没有卡片被翻转，或已经翻转了两张卡片，除了被选的卡片之外，让其它的卡片全部面朝下。
                indexOfTheOneAndOnlyFaceUpCard = chosenIndex
                cards[chosenIndex].beUpTime = Date()
            }
            cards[chosenIndex].hasUpAlready = true
        }
    }
        
    init(numberOfPairsOfCards: Int, theme: Theme, cardContentFactory: (Int) -> CardContent) {
        self.theme = theme
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: pairIndex * 2))
            cards.append(Card(content: content, id: pairIndex * 2 + 1))
        }
        cards.shuffle()
    }
    
    
    struct Card: Identifiable {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var hasUpAlready: Bool = false
        var content: CardContent
        var id: Int
        var beUpTime: Date? = nil
        
//        var beMatchedTime: Date? = nil
    }
}
