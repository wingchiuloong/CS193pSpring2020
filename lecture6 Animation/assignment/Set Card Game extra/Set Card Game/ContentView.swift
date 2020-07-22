//
//  SetGameView.swift
//  Set Card Game
//
//  Created by 龙泳潮 on 2020/7/10.
//  Copyright © 2020 龙泳潮. All rights reserved.
//

import SwiftUI

struct SetGameView: View {
    var body: some View {
        VStack {
            Oval()
            Oval()
            Oval()
        }.frame(width: 57, height: 87, alignment: .center).foregroundColor(.purple)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SetGameView()
    }

}
