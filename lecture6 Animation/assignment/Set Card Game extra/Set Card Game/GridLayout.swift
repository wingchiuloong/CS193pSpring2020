//
//  GridLayout.swift
//  Set Card Game
//
//  Created by 龙泳潮 on 2020/7/11.
//  Copyright © 2020 龙泳潮. All rights reserved.
//

import SwiftUI

struct GridLayout {
    var rowCount: Int = 1
    var coloumCount: Int = 0
    let itemsCount: Int
    let size: CGSize
    let desiredRatio: CGFloat
    
    init(itemsCount: Int, desiredRatio: CGFloat = 5.7 / 8.7, in size: CGSize) {
        self.itemsCount = itemsCount
        self.size = size
        self.desiredRatio = desiredRatio
        
        var bestArrange: (row: Int, coloum: Int) = (0, 0)
        var bestDiff: CGFloat = CGFloat.infinity
        if itemsCount > 0 {
            for coloum in 1...itemsCount {
                let row = itemsCount / coloum + (itemsCount % coloum != 0 ? 1 : 0)
                let itemWidth = self.size.width / CGFloat(coloum)
                let itemHeight = self.size.height / CGFloat(row)
                let currentRatio = itemWidth / itemHeight
                if abs(desiredRatio - currentRatio) < bestDiff {
                    bestDiff = abs(desiredRatio - currentRatio)
                    bestArrange = (row, coloum)
                }
            }
        }
        self.rowCount = bestArrange.row
        self.coloumCount = bestArrange.coloum
    }
    
    func itemRect(index: Int) -> CGRect {
        if self.coloumCount == 0 || self.rowCount == 0 {
            return CGRect.zero
        }
        let totalHeight = size.width / CGFloat(coloumCount) / desiredRatio * CGFloat(rowCount)
        let totalWidth = size.height / CGFloat(rowCount) * desiredRatio * CGFloat(coloumCount)
        var itemWidth: CGFloat
        var itemHeight: CGFloat
        if totalHeight > size.height {
            itemHeight = size.height / CGFloat(rowCount)
            itemWidth = itemHeight * desiredRatio
        } else if totalWidth > size.width {
            itemWidth = size.width / CGFloat(coloumCount)
            itemHeight = itemWidth / desiredRatio
        } else {
            itemWidth = size.width / CGFloat(coloumCount)
            itemHeight = size.height / CGFloat(rowCount)
        }
        
        let itemX = itemWidth * (CGFloat(index % coloumCount) + 0.5) + (CGFloat(index % coloumCount) * (size.width - itemWidth * CGFloat(coloumCount)) / CGFloat(coloumCount - 1))
        let itemY = itemHeight * (CGFloat(index / coloumCount) + 0.5) + (CGFloat(index / coloumCount) * (size.height - itemHeight * CGFloat(rowCount)) / CGFloat(rowCount - 1))
        let ans = CGRect(x: itemX, y: itemY, width: itemWidth, height: itemHeight)
        return ans
    }
    
    func itemOffset(index: Int) -> CGPoint {
        let itemrect = itemRect(index: index)
        let offsetX = size.width - itemrect.midX
        let offsetY = size.height - itemrect.midY
        return CGPoint(x: offsetX, y: offsetY)
    }
}
