//
//  Theme.swift
//  Memorize
//
//  Created by 龙泳潮 on 2020/7/7.
//  Copyright © 2020 龙泳潮. All rights reserved.
//

import SwiftUI

struct Theme: Identifiable {
    let id: Int
    let name: String
    var emojis: [String]
    let color: Color
}

var themes: [Theme] = [
    Theme(id: 0, name: "Halloween", emojis: ["👻", "🎃", "😈", "👿", "👹", "👺", "🤡", "💀", "☠️", "🤖", "👾", "👽"], color: .orange),
    Theme(id: 1, name: "Clothes", emojis: ["🥼", "👚", "👖", "👔", "👗", "👙", "👘", "🥻", "🩱", "🩳", "🦺", "🧥"], color: .blue),
    Theme(id: 2, name: "Animal face", emojis: ["🐶", "🐹", "🦊", "🐼", "🐯", "🦁", "🐷", "🐵", "🐸", "🐻", "🐱", "🐮"], color: .yellow),
    Theme(id: 3, name: "Chinese zodiac", emojis: ["🐀", "🐉", "🐂", "🐅", "🐇", "🐍", "🐎", "🐏", "🐒", "🐓", "🐕", "🐖"], color: .red),
    Theme(id: 4, name: "Fruit", emojis: ["🍎", "🍐", "🍊", "🍋", "🍌", "🍉", "🍇", "🍓", "🍒", "🍑", "🥭", "🍍"], color: .green),
    Theme(id: 5, name: "Jack", emojis: ["🇨🇳", "🇹🇩", "🇬🇧", "🇮🇴", "🇳🇿", "🇹🇷", "🇯🇵", "🇧🇩", "🇺🇸", "🇰🇼", "🇰🇷", "🇩🇪"], color: .black),
]


