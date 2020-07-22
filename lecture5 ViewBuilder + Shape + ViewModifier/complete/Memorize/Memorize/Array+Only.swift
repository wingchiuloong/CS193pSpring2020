//
//  Array+Only.swift
//  Memorize
//
//  Created by 龙泳潮 on 2020/6/23.
//  Copyright © 2020 龙泳潮. All rights reserved.
//

import Foundation

extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}
