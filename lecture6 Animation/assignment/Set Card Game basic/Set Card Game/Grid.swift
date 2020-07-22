//
//  Grid.swift
//  Set Card Game
//
//  Created by 龙泳潮 on 2020/7/11.
//  Copyright © 2020 龙泳潮. All rights reserved.
//
import SwiftUI

struct Grid<Item, ItemView>: View where Item: Identifiable, ItemView: View {
    private var items: [Item]
    private var viewForItem: (Item) -> ItemView
    
    init(_ items: [Item], viewForItem: @escaping (Item) -> ItemView) {
        self.items = items
        self.viewForItem = viewForItem
    }
    
    var body: some View {
        GeometryReader { geometry in
            self.body(for: GridLayout(itemsCount: self.items.count, in: geometry.size))
        }
    }
    
    private func body(for layout: GridLayout) -> some View {
        ForEach(items) { item in
            self.body(for: item, in: layout)
        }
    }
    
    private func body(for item: Item, in layout: GridLayout) -> some View {
        let index = items.firstIndex(matching: item)!
        return viewForItem(item)
            .frame(width: layout.itemRect(index: index).width, height: layout.itemRect(index: index).height)
            .position(CGPoint(x: layout.itemRect(index: index).minX, y: layout.itemRect(index: index).minY))
    }
    
}
