//
//  SetGameModel.swift
//  Set Card Game
//
//  Created by 龙泳潮 on 2020/7/10.
//  Copyright © 2020 龙泳潮. All rights reserved.
//

import SwiftUI

struct SetGameModel {
    
    private(set) var cardsInDeck: [Card] = []                   // 卡坞里的牌
    private(set) var cardsOnScreen: [Card] = []                 // 屏幕上的牌
    private(set) var cardsOfPlayer: [Array<Card>] = [[], []]    // 玩家赢得的牌
    private(set) var pointOfPlayer: [Int] = [0, 0]              // 玩家的得分
    private(set) var cardsBeChosen: [Card] = []                 // 屏幕上被选的卡牌,最多三张
    private(set) var playerOnControl: Int? = nil
    

    init() {
        var tempid = 0
        for i in 1...3 { // 按照特征值给卡坞里添加81张牌
            for j in 1...3 {
                for k in 1...3 {
                    for l in 1...3 {
                        cardsInDeck.append(Card(id: tempid, feature1: l, feature2: k, feature3: j, feature4: i))
                        tempid += 1
                    }
                }
            }
        }
        cardsInDeck.shuffle()
    }
    
    mutating func changeControl(player: Int?) {
        self.playerOnControl = player
    }
    
    mutating func deal() { /* 发3张牌到桌面 */
        if isSet() { // 如果以及被选的三张牌能组成set,则用新的卡牌替换已被选的卡牌
            for card in cardsBeChosen {
                if let index = cardsOnScreen.firstIndex(matching: card) {
                    if cardsInDeck.count > 0 {
                        cardsOnScreen[index] = cardsInDeck.remove(at: 0)
                    } else {
                        cardsOnScreen.remove(at: index)
                    }
                }
            }
            cardsBeChosen = []
        } else { // 否则,往屏幕末尾添加新的三张卡牌
            for _ in 1...3 {
                cardsOnScreen.append(cardsInDeck.remove(at: 0))
                if cardsInDeck.count == 0 {
                    return
                }
            }
        }
    }
    
    mutating func selectCard(card: Card) {// 在屏幕上选择某张牌
        cardsBeChosen.append(card)
        if let index = cardsOnScreen.firstIndex(matching: card) {
            cardsOnScreen[index].isChosen = true
        }
    }

    mutating func deselectCard(card: Card) { // 在屏幕上取消选择某张牌
        if let index = cardsBeChosen.firstIndex(matching: card) {
            cardsBeChosen.remove(at: index)
        }
        if let index = cardsOnScreen.firstIndex(matching: card) {
            cardsOnScreen[index].isChosen = false
        }
    }
    
    mutating func resetCardsOnScreen() {
        for card in cardsBeChosen {
            if let index = cardsOnScreen.firstIndex(matching: card) {
                cardsOnScreen[index].isChosen = false
            }
        }
        cardsBeChosen = []
        
    }
    
    mutating func isSet() -> Bool { // 判断三张牌是否组成Set并且修改三张牌的isMatched
        if cardsBeChosen.count != 3 { return false }
        let totalFeature1Value: Int = cardsBeChosen[0].feature1 + cardsBeChosen[1].feature1 + cardsBeChosen[2].feature1
        let totalFeature2Value: Int = cardsBeChosen[0].feature2 + cardsBeChosen[1].feature2 + cardsBeChosen[2].feature2
        let totalFeature3Value: Int = cardsBeChosen[0].feature3 + cardsBeChosen[1].feature3 + cardsBeChosen[2].feature3
        let totalFeature4Value: Int = cardsBeChosen[0].feature4 + cardsBeChosen[1].feature4 + cardsBeChosen[2].feature4
        func is369(_ number: Int) -> Bool { // 判断一个整数是否等于3或6或9
            if number == 3 || number == 6 || number == 9 {
                return true
            }
            return false
        }
        let ans = is369(totalFeature1Value) && is369(totalFeature2Value) && is369(totalFeature3Value) && is369(totalFeature4Value)
        for card in cardsBeChosen {
            if let index = cardsOnScreen.firstIndex(matching: card) {
                if ans  { cardsOnScreen[index].isMatched = true }
                else    { cardsOnScreen[index].isMatched = false }
            }
        }
        return ans
    }
    
    mutating func countPoint() {
        if isSet() {
            for card in cardsBeChosen {
                cardsOfPlayer[playerOnControl!].append(card)
            }
            pointOfPlayer[playerOnControl!] += 3
        } else {
            pointOfPlayer[playerOnControl!] -= 2
        }
    }
    
    struct Card: Identifiable {
        let id: Int
        let feature1: Int
        let feature2: Int
        let feature3: Int
        let feature4: Int
        var isChosen: Bool = false
        var isMatched: Bool? = nil
    }
}

