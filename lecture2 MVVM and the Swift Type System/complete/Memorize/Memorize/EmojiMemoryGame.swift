 //
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by 龙泳潮 on 2020/6/16.
//  Copyright © 2020 龙泳潮. All rights reserved.
//

// This is view-model of MVVM

import SwiftUI
 
class EmojiMemoryGame {
    private var model: MemoryGame<String> = EmojiMemoryGame.createMemeoryGame()
    
    static func createMemeoryGame() -> MemoryGame<String> {
        let emojis: Array<String> = ["👺", "🤡", "🤖"]
        return MemoryGame<String>(numberOfPairsOfCards: emojis.count) { pairIndex in
            return emojis[pairIndex]
        }
    }
    
    // MARK: - Access to the model
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    
    // MARK: - Intent(s)
    
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
}
