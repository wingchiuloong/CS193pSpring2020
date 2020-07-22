 //
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by 龙泳潮 on 2020/6/16.
//  Copyright © 2020 龙泳潮. All rights reserved.
//

// This is view-model of MVVM

import SwiftUI
 
class EmojiMemoryGame: ObservableObject { // view-model一般都是class
    @Published private var model = EmojiMemoryGame.createMemeoryGame() // 这里使用EmojiMemoryGame.而不是self.是因为static定义的函数必须这样做才行。否则报错
    
    /* static是不用创建实例就可以使用的东西，所以createMemoryGame要被上面使用就必须声明static */
    static func createMemeoryGame() -> MemoryGame<String> { // 因为要返回不同的content，所以只能再写一个函数去做。
        let emojis: Array<String> = ["👺", "🤡", "🤖"]
        return MemoryGame<String>(numberOfPairsOfCards: emojis.count) { pairIndex in
            return emojis[pairIndex]
        }
    }
    
    
    
    // MARK: - Access to the model
    
    var cards: Array<MemoryGame<String>.Card> { // 因为model被定义为private了，所以不能通过EmojiMemoryGame直接访问model的cards，只能再定义变量间接访问
        model.cards
    }
    
    
    // MARK: - Intent(s)
    
    func choose(card: MemoryGame<String>.Card) { // 同cards，也只能间接访问
        model.choose(card: card)
    }
}
