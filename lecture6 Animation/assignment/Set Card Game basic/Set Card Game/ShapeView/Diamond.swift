//
//  Diamond.swift
//  Set Card Game
//
//  Created by 龙泳潮 on 2020/7/10.
//  Copyright © 2020 龙泳潮. All rights reserved.
//

import SwiftUI

struct Diamond: Shape {
    var isShading: Bool = false
    
    func path(in rect: CGRect) -> Path {
        
        let bottomCenter = CGPoint(x: rect.midX, y: rect.minY)
        let rightCenter = CGPoint(x: rect.maxX, y: rect.midY)
        let topCenter = CGPoint(x: rect.midX, y: rect.maxY)
        let leftCenter = CGPoint(x: rect.minX, y: rect.midY)
        
        var p = Path()
        p.move(to: bottomCenter)
        p.addLine(to: rightCenter)
        p.addLine(to: topCenter)
        p.addLine(to: leftCenter)
        p.addLine(to: bottomCenter)
        if isShading {
            let partX = rect.width / 6
            let partY = rect.height / 6
            let up1 = CGPoint(x: rect.minX + 1 * partX, y: rect.midY - 1 * partY)
            let up2 = CGPoint(x: rect.minX + 2 * partX, y: rect.midY - 2 * partY)
            let up3 = CGPoint(x: rect.minX + 3 * partX, y: rect.midY - 3 * partY)
            let up4 = CGPoint(x: rect.minX + 4 * partX, y: rect.midY - 2 * partY)
            let up5 = CGPoint(x: rect.minX + 5 * partX, y: rect.midY - 1 * partY)
            let down1 = CGPoint(x: rect.minX + 1 * partX, y: rect.midY + 1 * partY)
            let down2 = CGPoint(x: rect.minX + 2 * partX, y: rect.midY + 2 * partY)
            let down3 = CGPoint(x: rect.minX + 3 * partX, y: rect.midY + 3 * partY)
            let down4 = CGPoint(x: rect.minX + 4 * partX, y: rect.midY + 2 * partY)
            let down5 = CGPoint(x: rect.minX + 5 * partX, y: rect.midY + 1 * partY)
            
            p.move(to: up1)
            p.addLine(to: down1)
            p.move(to: up2)
            p.addLine(to: down2)
            p.move(to: up3)
            p.addLine(to: down3)
            p.move(to: up4)
            p.addLine(to: down4)
            p.move(to: up5)
            p.addLine(to: down5)
        }
        return p
    }
}


