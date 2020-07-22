//
//  PickShape.swift
//  Set Card Game
//
//  Created by 龙泳潮 on 2020/7/12.
//  Copyright © 2020 龙泳潮. All rights reserved.
//

import SwiftUI
 
struct PickShape: Shape {
    var isShading: Bool
    var whichShape: Int
    
    init(whichShape: Int, isShading: Bool) {
        self.isShading = isShading
        self.whichShape = whichShape
    }
    
    func path(in rect: CGRect) -> Path {
        if self.whichShape == 1 {
            return Diamond(isShading: self.isShading).path(in: rect)
        } else if self.whichShape == 2 {
            return Oval(isShading: self.isShading).path(in: rect)
        } else {
            return Squiggle(isShading: self.isShading).path(in: rect)
        }
    }
}
