//
//  Players.swift
//  PlayShare
//
//  Created by Victoria Grönqvist on 2018-04-13.
//  Copyright © 2018 Victoria Grönqvist. All rights reserved.
//

import UIKit
import SpriteKit

enum Score {
    //case Won(Int)
    case Won
    case Lost
    case NotPlayedYet
}

class Player: NSObject {
    var sprite : SKSpriteNode
    var name : String
    var wonGame : Bool = true
    var score : Score
    
    
    init(sprite : SKSpriteNode, name : String) {
        self.sprite = sprite
        self.name = name
        score = .NotPlayedYet
    }
    
    init(name : String) {
        self.name = name
        wonGame = false
        sprite = SKSpriteNode()
        score = .NotPlayedYet
    }
    
}
