//
//  Array+Identifiable.swift
//  Memorize
//
//  Created by 龙泳潮 on 2020/6/23.
//  Copyright © 2020 龙泳潮. All rights reserved.
//

import Foundation

extension Array where Element: Identifiable {
    func firstIndex(matching: Element) -> Int? {
        for index in 0..<self.count {
            if self[index].id == matching.id {
                return index
            }
        }
        return nil
    }
} 
