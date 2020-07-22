//
//  SetGame.swift
//  Set Card Game
//
//  Created by 龙泳潮 on 2020/7/10.
//  Copyright © 2020 龙泳潮. All rights reserved.
//

import SwiftUI

struct SetGame {
    
    var cards: [Card] = []
    
    
    
    struct Card: Identifiable {
        let id: Int
        let number: Int
        let color: Int // 1 for red, 2 for green, 3 for purple
        let shape: Int // 1 for diamond, 2 for oval, 3 for squiggle
        let shading: Int // 1 for solid, 2 for striped, 3 for open
        var isSelect: Bool
    }
}
