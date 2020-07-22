//
//  EmojiMemoryGame.swift
//  Memories
//
//  Created by LYC on 2020/6/11.
//  Copyright © 2020 龙泳潮. All rights reserved.
//

import SwiftUI

class EmojiMemoryGame {
    private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame() // private就是只能自己访问
    
    static func createMemoryGame() -> MemoryGame<String> {
        var emojis = ["🤩", "🐽", "🐭", "🤠", "🐸", "🐔", "🐼", "🦄", "🐙", "🐈", "🦮"] // 加分项
        emojis = emojis.shuffled() // 加分项
        let cardsNumber = Int.random(in: 2...5) // 任务4
        return MemoryGame<String>(numberOfPairsOfCards: cardsNumber) { pairIndex in
            emojis[pairIndex]
        }
    }
        
    
    // MARK: - Access to the Model
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    // MARK: - Intent(s)
    
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
}
