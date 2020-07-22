//
//  SetGameView.swift
//  Set Card Game
//
//  Created by 龙泳潮 on 2020/7/10.
//  Copyright © 2020 龙泳潮. All rights reserved.
//

import SwiftUI

struct SetGameView: View {
    @ObservedObject var viewModel: SetGame
    enum player: Int {
        case playerDown
        case playerUp
    }
    
    var body: some View {
        VStack {
            
            BarView(viewModel: viewModel, player: player.playerUp.rawValue).rotationEffect(Angle(degrees: 180))
                
            Divider()
            
            Grid(self.viewModel.cardsOnScreen) { card in
                CardView(viewModel: self.viewModel, card: card)
                    .padding(3)
                    .transition(.offset(x: -1000, y: 0))
                    .animation(.easeInOut(duration: 1))
                    .onTapGesture {
                        if self.viewModel.playerOnControl != nil { // 有玩家亮灯了
                            if self.viewModel.cardsBeChosen.count < 3 { // 已选的卡少于三张
                                if !card.isChosen { // 该卡还没有被选择
                                    self.viewModel.selectCard(card: card)
                                    if self.viewModel.cardsBeChosen.count == 3 { // 选择的卡牌数等于3
                                        self.viewModel.countPoint()
                                        self.viewModel.changeControl(player: nil)
                                    }
                                } else if card.isChosen { // 该卡已经被选择了
                                    self.viewModel.removeCard(card: card)
                                }
                            }
                            else { // 已选择的卡牌等于3了
                                if self.viewModel.isSet() { // 如果是set
                                    self.viewModel.deal()
                                } else { // 如果不是set
                                    self.viewModel.resetCardsOnScreen()
                                }
                                if let index = self.viewModel.cardsOnScreen.firstIndex(matching: card) { // 实现点了三张牌之后再点这三张牌的其中一张的机制
                                    if !self.viewModel.cardsOnScreen[index].isChosen {
                                        self.viewModel.selectCard(card: card)
                                    }
                                }
                            }
                        }
                    }
            }.onAppear {
                for _ in 0..<4 {
                    self.viewModel.deal()
                }
            }
            
            Divider()
            
            BarView(viewModel: viewModel, player: player.playerDown.rawValue)
        }
            
        .statusBar(hidden: true)
        .edgesIgnoringSafeArea(.all)
    }
}

struct SetGameView_Previews: PreviewProvider {
    static var previews: some View {
        SetGameView(viewModel: SetGame())
    }
}
