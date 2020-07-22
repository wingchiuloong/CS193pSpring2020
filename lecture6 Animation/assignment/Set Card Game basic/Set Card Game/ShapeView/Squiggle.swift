//
//  Squiggle.swift
//  Set Card Game
//
//  Created by 龙泳潮 on 2020/7/10.
//  Copyright © 2020 龙泳潮. All rights reserved.
//

import SwiftUI

struct Squiggle: Shape {
    
    var isShading: Bool = false
    
    func path(in rect: CGRect) -> Path {
        
        let heightQuarter = rect.height / 4
        let widthQuarter = rect.width / 4
        
        let H = heightQuarter // 拱形圆弧的高
        let L = widthQuarter * 2 // 圆弧的宽
        let R = (H*H + L*L/4) / (2 * H) // 根据H L得到圆弧的半径
        let centerLeftTop = CGPoint(x: rect.minX + widthQuarter, y: rect.minY + R) // 左上圆弧的圆心
        let centerLeftBottom = CGPoint(x: rect.minX + widthQuarter, y: rect.midY + R) // 左下圆弧的圆心
        let centerRightTop = CGPoint(x: rect.midX + widthQuarter, y: rect.midY - R) // 右上圆弧的圆心
        let centerRightBottom = CGPoint(x: rect.midX + widthQuarter, y: rect.maxY - R) // 右下圆弧的圆心
        let angle = Double(atan(widthQuarter / (R - heightQuarter))) * 180 / Double.pi // 圆弧圆心角的一半
        
        let cornerLeftTop = CGPoint(x: rect.minX, y: rect.minY + heightQuarter) // 多边形左上的顶点位置
        let cornerRightBottom = CGPoint(x: rect.maxX, y: rect.midY + heightQuarter) // 多边形右下顶点的位置
        
        var p = Path()
        
        p.move(to: cornerLeftTop)
        /* 画右上的圆弧 */
        p.addArc(center: centerLeftTop, radius: R,
                 startAngle: Angle(degrees: 270 - angle),
                 endAngle: Angle(degrees: 270 + angle),
                 clockwise: false)
        /* 画左上的圆弧*/
        p.addArc(center: centerRightTop, radius: R,
                 startAngle: Angle(degrees: 90 + angle),
                 endAngle: Angle(degrees: 90 - angle),
                 clockwise: true)
        p.addLine(to: cornerRightBottom)
        /* 画左下的圆弧*/
        p.addArc(center: centerRightBottom, radius: R,
                 startAngle: Angle(degrees: 90 - angle),
                 endAngle: Angle(degrees: 90 + angle),
                 clockwise: false)
        /* 画右下的圆弧 */
        p.addArc(center: centerLeftBottom, radius: R,
                 startAngle: Angle(degrees: 270 + angle),
                 endAngle: Angle(degrees: 270 - angle),
                 clockwise: true)
        p.addLine(to: cornerLeftTop)
        
        /* 画条纹 */
        if self.isShading {
            let partX = rect.width / 6
            
            let X1 = rect.minX + 1 * partX
            let up1 = CGPoint(x: X1, y: getYAtX(centre: centerLeftTop, r: R, x: X1, isUpper: true))
            let down1 = CGPoint(x: X1, y: getYAtX(centre: centerLeftBottom, r: R, x: X1, isUpper: true))
            
            let X2 = rect.minX + 2 * partX
            let up2 = CGPoint(x: X2, y: getYAtX(centre: centerLeftTop, r: R, x: X2, isUpper: true))
            let down2 = CGPoint(x: X2, y: getYAtX(centre: centerLeftBottom, r: R, x: X2, isUpper: true))
  
            let up3 = CGPoint(x: rect.midX, y: rect.midY - heightQuarter)
            let down3 = CGPoint(x: rect.midX, y: rect.midY + heightQuarter)
            
            let X4 = rect.minX + 4 * partX
            let up4 = CGPoint(x: X4, y: getYAtX(centre: centerRightTop, r: R, x: X4, isUpper: false))
            let down4 = CGPoint(x: X4, y: getYAtX(centre: centerRightBottom, r: R, x: X4, isUpper: false))
            
            let X5 = rect.minX + 5 * partX
            let up5 = CGPoint(x: X5, y: getYAtX(centre: centerRightTop, r: R, x: X5, isUpper: false))
            let down5 = CGPoint(x: X5, y: getYAtX(centre: centerRightBottom, r: R, x: X5, isUpper: false))
            
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
    
    private func getYAtX(centre: CGPoint, r: CGFloat, x: CGFloat, isUpper: Bool = false) -> CGFloat {
        let h = centre.x
        let k = centre.y
        if isUpper {
            return abs(k - sqrt(pow(r, 2.0) - pow(x - h, 2.0)))
        }else {
            return abs(sqrt(pow(r, 2.0) - pow(x - h, 2.0)) + k)
        }
    }
    
}
