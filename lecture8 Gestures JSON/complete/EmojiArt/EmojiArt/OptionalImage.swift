//
//  OptionalImage.swift
//  EmojiArt
//
//  Created by 龙泳潮 on 2020/7/21.
//  Copyright © 2020 龙泳潮. All rights reserved.
//

import SwiftUI

struct OptionalImage: View {
    var uiImage: UIImage?
    
    var body: some View {
        Group {
            if uiImage != nil {
                Image(uiImage: uiImage!)
            }
        }
    }
}

