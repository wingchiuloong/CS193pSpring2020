//
//  Oval.swift
//  Set Card Game
//
//  Created by 龙泳潮 on 2020/7/10.
//  Copyright © 2020 龙泳潮. All rights reserved.
//

import SwiftUI

struct Oval: Shape {
    var isShading: Bool = false
    
    func path(in rect: CGRect) -> Path {
        var p = Path()
        p.addEllipse(in: rect)
        if self.isShading {
            let centre = CGPoint(x: rect.midX, y: rect.minY)
            let a = rect.width / 2
            let b = rect.height / 2
            let partX = rect.width / 6
            
            let X1 = rect.minX + 1 * partX
            let up1 = CGPoint(x: X1, y: rect.midY - self.getYAtX(centre: centre, x: X1, a: a, b: b))
            let down1 = CGPoint(x: X1, y: rect.midY + self.getYAtX(centre: centre, x: X1, a: a, b: b))
            
            let X2 = rect.minX + 2 * partX
            let up2 = CGPoint(x: X2, y: rect.midY - self.getYAtX(centre: centre, x: X2, a: a, b: b))
            let down2 = CGPoint(x: X2, y: rect.midY + self.getYAtX(centre: centre, x: X2, a: a, b: b))
            
            let X3 = rect.minX + 3 * partX
            let up3 = CGPoint(x: X3, y: rect.midY - self.getYAtX(centre: centre, x: X3, a: a, b: b))
            let down3 = CGPoint(x: X3, y: rect.midY + self.getYAtX(centre: centre, x: X3, a: a, b: b))
            
            let X4 = rect.minX + 4 * partX
            let up4 = CGPoint(x: X4, y: rect.midY - self.getYAtX(centre: centre, x: X4, a: a, b: b))
            let down4 = CGPoint(x: X4, y: rect.midY + self.getYAtX(centre: centre, x: X4, a: a, b: b))
            
            let X5 = rect.minX + 5 * partX
            let up5 = CGPoint(x: X5, y: rect.midY - self.getYAtX(centre: centre, x: X5, a: a, b: b))
            let down5 = CGPoint(x: X5, y: rect.midY + self.getYAtX(centre: centre, x: X5, a: a, b: b))
            
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
    
    private func getYAtX(centre: CGPoint, x: CGFloat, a: CGFloat, b: CGFloat) -> CGFloat {
        let h = centre.x
        let k = centre.y
        return abs(sqrt(pow(b, 2.0) * (1 - pow(x - h, 2.0) / pow(a, 2.0))) + k)
    }
}

