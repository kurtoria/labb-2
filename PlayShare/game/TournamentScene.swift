//
//  TournamentScene.swift
//  PlayShare
//
//  Created by Victoria Grönqvist on 2018-04-18.
//  Copyright © 2018 Victoria Grönqvist. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit

class TournamentScene : SKScene {
    var players = [Player].self
    var player : Player!
    var playerName : String = ""
    
    
    //var view : SKView?
    
    var target : CGPoint?
    
    override func didMove(to view: SKView) {
        print("Goes into didMove-func")
        setUpPlayer()
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            target = touch.location(in: self)
            if let t = target {
                print("TournamentScene: x is \(t.x), y is \(t.y)")
            }
        }
        
    }
    
    func setView() {
        
    }
    
    func setUpPlayer() {
        let playerSprite = SKSpriteNode( imageNamed: "SpaceForNameColor")
        playerSprite.position = CGPoint(x: 0.46000000834465, y: 0.516491770744324)
        playerSprite.xScale = 0.001
        playerSprite.yScale = 0.001
        addChild(playerSprite)
        player = Player(sprite: playerSprite, name: playerName)
        print("Name: \(playerName), size on playerSprite: \(playerSprite.size)")
    }
    
}
