 //
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by 龙泳潮 on 2020/6/16.
//  Copyright © 2020 龙泳潮. All rights reserved.
//

// This is view-model of MVVM

import SwiftUI
 
class EmojiMemoryGame: ObservableObject {
    @Published var model = EmojiMemoryGame.createMemeoryGame()
    
    
    static func createMemeoryGame() -> MemoryGame<String> {
        let theme: Theme = themes.shuffled().first!
        let emojis: Array<String>  = theme.emojis.shuffled()
        let numberOfPairsOfCards: Int = Int.random(in: (emojis.count - 5)...emojis.count)
        return MemoryGame<String>(numberOfPairsOfCards: numberOfPairsOfCards, theme: theme) { pairIndex in
            return emojis[pairIndex]
        }
    }
    

    // MARK: - Access to the model
    var score: Int {
        model.score
    }
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    var theme: Theme {
        model.theme
    }
    
    // MARK: - Intent(s)
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
}
