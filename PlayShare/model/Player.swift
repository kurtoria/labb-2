//
//  Players.swift
//  PlayShare
//
//  Created by Victoria Grönqvist on 2018-04-13.
//  Copyright © 2018 Victoria Grönqvist. All rights reserved.
//

import UIKit
import SpriteKit

/*
enum Score {
    //case Won(Int)
    case Won
    case Lost
    case NotPlayedYet
}
*/

class Player: NSObject, NSCoding {
    
    var name : String
    var sprite : SKSpriteNode
    var wonGame : Bool = false
    //var score : Score
    var oddPlayer : Bool
    
    init(name : String, sprite : SKSpriteNode) {
        self.name = name
        self.sprite = sprite
        //score = .NotPlayedYet
        oddPlayer = false
    }
    
    init(name : String) {
        self.name = name
        sprite = SKSpriteNode()
        wonGame = false
        //score = .NotPlayedYet
        oddPlayer = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        name = aDecoder.decodeObject(forKey: "name") as! String
        sprite = aDecoder.decodeObject(forKey: "sprite") as! SKSpriteNode
        wonGame = aDecoder.decodeObject(forKey: "wonGame") as! Bool
        //score = aDecoder.decodeObject(forKey: "score") as! Score
        oddPlayer = aDecoder.decodeObject(forKey: "oddPlayer") as! Bool
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: "name")
        aCoder.encode(sprite, forKey: "sprite")
        aCoder.encode(wonGame, forKey: "wonGame")
        //aCoder.encode(score, forKey: "score")
        aCoder.encode(oddPlayer, forKey: "oddPlayer")
    }
    
}
