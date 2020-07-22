//
//  Grid.swift
//  Memorize
//
//  Created by LYC on 2020/6/22.
//  Copyright © 2020 龙泳潮. All rights reserved.
//

import SwiftUI

struct Grid<Item, ItemView>: View where Item: Identifiable, ItemView: View { // Item是可识别的，ItemView是UI
    var items: [Item]
    var viewForItem: (Item) -> ItemView
    
    init(_ items: [Item], viewForItem: @escaping (Item) -> ItemView) { // 初始化，接收卡片组和单个卡片闭包返回的View
        self.items = items
        self.viewForItem = viewForItem
    }
    
    var body: some View {
        GeometryReader { geometry in
            self.body(for: GridLayout(itemCount: self.items.count, in: geometry.size)) // GridLayout的作用就是：你告诉它卡片的数量和卡片组的UI的大小，它就能安排所有卡片的位置
        }
    }
    
    /* 返回卡片组中所有卡片的长宽和位置参数 */
    func body(for layout: GridLayout) -> some View { // 接收GridLayout，返回很多View
        ForEach(items) { item in
            self.body(for: item, in: layout)
        }
    }
    
    /* 在GridLayout中获得某张卡片的长宽和位置参数 */
    func body(for item: Item, in layout: GridLayout) -> some View { // 接收一张卡片和网格布局
        let index = items.firstIndex(matching: item)! // index是item的下标，既然是卡组里面的卡，就肯定能匹配，所以是强制解包。
        return viewForItem(item)
            .frame(width: layout.itemSize.width, height: layout.itemSize.height) // 使用网格布局指定的框架
            .position(layout.location(ofItemAt: index)) // 在网格布局指定的位置放置卡片
    }
}


