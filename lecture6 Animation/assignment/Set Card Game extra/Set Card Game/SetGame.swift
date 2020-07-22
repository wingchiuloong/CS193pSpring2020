//
//  SetGame.swift
//  Set Card Game
//
//  Created by 龙泳潮 on 2020/7/11.
//  Copyright © 2020 龙泳潮. All rights reserved.
//

import SwiftUI

class SetGame: ObservableObject {
    @Published private var model = createSetGameModel()
    
    private static func createSetGameModel() -> SetGameModel {                          // 创建游戏
        let newGame = SetGameModel()
        return newGame
    }
    
    func resetNewGame() {
        model = SetGame.createSetGameModel()
        for _ in 0..<4 {
            deal()
        }
    }                                                                           // 重开游戏
    func selectCard(card: SetGameModel.Card) { model.selectCard(card: card) }           // 选择卡牌
    func removeCard(card: SetGameModel.Card) { model.deselectCard(card: card) }           // 取消选择卡牌
    func deal() { model.deal() }                                                        // 发3张牌到屏幕上
    func countPoint() { model.countPoint() }
    func changeControl(player: Int?) { model.changeControl(player: player) }
    func isSet() -> Bool { model.isSet() }
    func resetCardsOnScreen() { model.resetCardsOnScreen() }
 
    var cardsInDeck: [SetGameModel.Card] { model.cardsInDeck }              // 卡坞上的卡牌
    var cardsOnScreen: [SetGameModel.Card] { model.cardsOnScreen }          // 屏幕上的卡牌
    var cardsOfPlayer: [Array<SetGameModel.Card>] { model.cardsOfPlayer }   // 玩家赢得的卡牌
    var pointOfPlayer: [Int] { model.pointOfPlayer }                        // 玩家的得分
    var cardsBeChosen: [SetGameModel.Card] { model.cardsBeChosen }          // 屏幕上被选择的卡牌
    var playerOnControl: Int? { model.playerOnControl }
    
}
