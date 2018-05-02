//
//  Players.swift
//  PlayShare
//
//  Created by Victoria Grönqvist on 2018-04-13.
//  Copyright © 2018 Victoria Grönqvist. All rights reserved.
//

import UIKit
import SpriteKit

class Player: NSObject {
    var sprite : SKSpriteNode
    var name : String
    var wonGame : Bool = true
    
    init(sprite : SKSpriteNode, name : String) {
        self.sprite = sprite
        self.name = name
    }
    
    init(name : String) {
        self.name = name
        wonGame = false
        sprite = SKSpriteNode()
    }
    
}
