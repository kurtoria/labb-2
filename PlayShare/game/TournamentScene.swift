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
    var players = TournamentViewController.seguedPlayers
    var target : CGPoint?
    
    override func didMove(to view: SKView) {
        print("Number of players in TournamentScene: \(players.count)")
        setUpPlayers()
        placePlayers()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            target = touch.location(in: self)
            if let t = target {
                print("TournamentScene: x is \(t.x), y is \(t.y)")
            }
        }
        
    }
    
    func setUpPlayers() {
        for p in players {
            //let playerSprite = SKSpriteNode( imageNamed: "SpaceForNameColor")
            //playerSprite.xScale = 0.0012
            //playerSprite.yScale = 0.0012
            
            let playerSprite = SKSpriteNode(color: UIColor.lightGray, size: CGSize(width: 0.25, height: 0.05))
            playerSprite.position = CGPoint(x: 0.46000000834465, y: 0.516491770744324)
            addChild(playerSprite)
            p.sprite = playerSprite
            
            createTextForButtons(name: p.name, pos: playerSprite.position)
            
            //createButtons(size: playerSprite.size, pos: playerSprite.position, xScale: playerSprite.xScale, yScale: playerSprite.yScale, name: p.name)
            
            print("Name: \(p.name), won game: \(p.wonGame), size on playerSprite: \(playerSprite.size)")
        }
    }
    
    func placePlayers() {
        var i = 0
        for (index, p) in players.enumerated() {
            
            if i > 0 {
                //p.sprite.position.x =
                //p.sprite.position.y =
                p.sprite.position = CGPoint(x: 0.15, y: 0.83/*0.96*/)
                print("\(index), Position for \(p.name) is \(p.sprite.position).")
            } else {
                p.sprite.position = CGPoint(x: 0.15, y: 0.89)
                print("\(index), Position for \(p.name) is \(p.sprite.position).")
                i += 1
                print("I is: \(i)")
            }
        }
    }
    
    func createTextForButtons(name : String, pos : CGPoint) {
        let buttonText = SKLabelNode(text: name)
        buttonText.position = pos
        //button.xScale = xScale
        //button.yScale = yScale
        buttonText.fontColor = UIColor.black
        buttonText.fontSize = 10
        buttonText.fontName = "Helvetica"
        buttonText.zPosition = 2
        addChild(buttonText)
        print("ButtonText created")
    }
    
    
    
    func createButtons(size : CGSize, pos : CGPoint, xScale : CGFloat, yScale : CGFloat, name : String) {
        let button = SKSpriteNode(color: UIColor.red, size: size)
        //var button = SKSpriteNode

        button.position = pos
        button.xScale = xScale
        button.yScale = yScale
        button.zPosition = 1
        addChild(button)
        print("Button created")
        
        let buttonText = SKLabelNode(text: name)
        buttonText.position = pos
        button.xScale = xScale
        button.yScale = yScale
        buttonText.fontColor = UIColor.black
        buttonText.fontSize = 5
        addChild(buttonText)
        print("ButtonText created")
    }
    
    
    /*
    override func didMoveToView(view: SKView) {
        // Create a simple red rectangle that's 100x44
        button = SKSpriteNode(color: SKColor.redColor(), size: CGSize(width: 100, height: 44))
        // Put it in the center of the scene
        button.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame));
        
        self.addChild(button)
    }
    
    override func touchesEnded(touches: NSSet, withEvent event: UIEvent) {
        // Loop over all the touches in this event
        for touch: AnyObject in touches {
            // Get the location of the touch in this scene
            let location = touch.locationInNode(self)
            // Check if the location of the touch is within the button's bounds
            if button.containsPoint(location) {
                println("tapped!")
            }
        }
     }
    }
    */

    
    
    
    
    
    func numbersOfPlayers() -> Int {
        switch players.count {
        case 1:
            return 1
        case 2:
            return 2
        case 3:
            return 3
        case 4:
            return 4
        case 5:
            return 5
        case 6:
            return 6
        case 7:
            return 7
        case 8:
            return 8
        case 9:
            return 9
        case 10:
            return 10
        default:
            print("Does not return any number")
            return 0
        }
    }
}

