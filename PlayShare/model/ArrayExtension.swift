//
//  ArrayExtension.swift
//  PlayShare
//
//  Created by Victoria Grönqvist on 2018-05-03.
//  Copyright © 2018 Victoria Grönqvist. All rights reserved.
//

import Foundation

extension Array {
    
    mutating func shuffle() {
        for i in 0 ..< (count - 1) {
            let p = Int(arc4random_uniform(UInt32(count - i))) + i
            swapAt(i, p)
        }
    }
    
}
