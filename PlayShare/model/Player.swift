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
    
    var name : String
    var sprite : SKSpriteNode
    var wonGame : Bool = false
    var oddPlayer : Bool
    
    init(name : String, sprite : SKSpriteNode) {
        self.name = name
        self.sprite = sprite
        oddPlayer = false
    }
    
    init(name : String) {
        self.name = name
        sprite = SKSpriteNode()
        wonGame = false
        oddPlayer = false
    }

    
}
