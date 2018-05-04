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
    
    var originalPlayers = TournamentViewController.seguedPlayers
    var model : TournamentModel = TournamentModel(players: TournamentViewController.seguedPlayers)

    /*
    var originalPlayers = TournamentViewController.seguedPlayers
    var players : [Player] = []
    var winners : [Player] = []
    var losers : [Player] = []
    var filteredPlayers : [Player] = []
    var filteredPlayer = Player(name: "")
    */
    //var shuffledPlayers : [Player] = []
    var target : CGPoint?
    var y0 = 598.0
    var y1 = 560.0
    var evenY : Double = 0.0
    var oddY : Double = 0.0
    var firstXPos : Double = 60.0
    
    override func didMove(to view: SKView) {
        print("Number of players in TournamentScene: \(model.originalPlayers.count)")
        evenY = y0 - 95
        oddY = y1 - 95
        
        
        
        model.originalPlayers.shuffle()
        setUpPlayers()
        model.oddOrNot()
        print("Players length: \(model.players.count)")
        
        //place first two players
        placePlayers(y0: y0, y1: y1)
 
        //DO THINGS. LOTSA THINGS WHOLE GEEEEMEE
        
        /*
        if !model.ifOddPlayers(players: model.players.count) {
            print("Goes into oddplayers")
            //placeOddRound()
        }
        */
        
        //#warning fix better condition
        if model.filteredPlayer.wonGame == false {
            print("Goes into oddplayers")
            placeOddRound()
        }
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
        for p in model.originalPlayers {
            p.sprite = SKSpriteNode(color: UIColor.lightGray, size: CGSize(width: 100, height: 30))
            addChild(p.sprite)
            //p.sprite.isUserInteractionEnabled = true
            print("Name: \(p.name)")
        }
    }
    
    /*
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("Touch began")
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("Touch ended")
    }
 */
    
    
    /*
    func createSpriteNode(sprite : SKSpriteNode?) {
        s = SKSpriteNode(color: UIColor.lightGray, size: CGSize(width: 100, height: 30))
        addChild(s)
    }
 */
    
    
  
    
    //moved
    /*
    func oddOrNot() {
        if !ifOddPlayers(players: originalPlayers.count) {
            //Om de är ojämna
            print("Not even!")
            //let removed = originalPlayers.endIndex
            
            
            //filteredPlayers.append()
            
            //originalPlayers.remove(at: removed - 1)
            if let last = originalPlayers.last {
                //filteredPlayer = originalPlayers.last
                filteredPlayer = last
                print("Filtered player: \(filteredPlayer.name)")
            }
            originalPlayers.remove(at: originalPlayers.endIndex - 1)
           
        } /*else {
            //om de är jämna
            
        }*/
        players = originalPlayers
        print("OriginalPlayers length: \(originalPlayers.count)")
    }
    */
    
    /*
    func ifOddPlayers(players : Int) -> Bool {
        if players % 2 == 0 {
            return true
        } else {
            return false
        }
    }
    */
    
    
    func placePlayers(y0 : Double, y1 : Double) {
        var i = 0
        for (index, p) in model.players.enumerated() {
            let sum = index % 2
            
            if i == 0 {
                placeFirstRoundPlayer(yPos: y0, p: p, index: index)
                i += 1
                print("I is: \(i)")
            } else if i == 1 {
                placeFirstRoundPlayer(yPos: y1, p: p, index: index)
                i += 1
            } else {
                print("Goes into else")
                if index % 2 == 0 {
                    
                    print("Sum: \(sum)")
                    placeFirstRoundPlayer(yPos: evenY, p: p, index: index)
                    print("Number in if modulus: \(index)")
                    evenY = evenY - 95
                } else {
                    print("Sum: \(sum)")
                    placeFirstRoundPlayer(yPos: oddY, p: p, index: index)
                    print("Number in else else: \(index)")
                    oddY = oddY - 95
                }
            }
        }
    }
    
 
    func placeSinglePlayer(xPos : Double, yPos : Double, p : Player, index : Int) {
        p.sprite.position = CGPoint(x: xPos, y: yPos)
        createTextForButtons(name: p.name, pos: p.sprite.position)
        print("\(index), Position for \(p.name) is \(p.sprite.position).")
    }
    
    func placeFirstRoundPlayer(yPos : Double, p : Player, index : Int) {
        //p.sprite.position = CGPoint(x: 60.0, y: yPos)
        //createTextForButtons(name: p.name, pos: p.sprite.position)
        //print("\(index), Position for \(p.name) is \(p.sprite.position).")
        placeSinglePlayer(xPos: firstXPos, yPos: yPos, p: p, index: index)
    }
    
    func placeOddRound() {
        model.connectOddRound(randomPlayer: model.getRandomPlayer(array: model.players), filteredPlayer: model.filteredPlayer)
        for (index, p) in model.oddRoundPlayers.enumerated() {
            print("Odd players name: \(p.name)")
            placeSinglePlayer(xPos: firstXPos + 120.0, yPos: y0, p: p, index: index)
            y0 = y1
        }
    }
    
    
    func createTextForButtons(name : String, pos : CGPoint) {
        /*
        let buttonText = SKLabelNode(text: name)
        buttonText.position = pos
        
        buttonText.fontColor = UIColor.black
        buttonText.fontSize = 0.010
        buttonText.fontName = "Helvetica"
        buttonText.zPosition = 5
        buttonText.verticalAlignmentMode = SKLabelVerticalAlignmentMode(rawValue: 1)!
        addChild(buttonText)
        print("Position for buttonText is: x: \(buttonText.position.x), y: \(buttonText.position.y)")
        print("ButtonText created with name \(name)")
        */
        let newPos = pos.y - 6
        let buttonText = SKLabelNode(fontNamed: "Arial")
        buttonText.text = name
        buttonText.fontSize = 20
        buttonText.fontColor = SKColor.black
        buttonText.position = pos
        buttonText.position.y = newPos
        self.addChild(buttonText)
        
        
        //button.xScale = xScale
        //button.yScale = yScale
        //0, Position for clön is (0.150000005960464, 0.889999985694885).
        //1, Position for hll is (0.150000005960464, 0.829999983310699).
        //Position for button is: x: 0.46000000834465, y: 0.516491770744324
        
        
    }
 
    
    
    
    func createButtons(size : CGSize, pos : CGPoint, xScale : CGFloat, yScale : CGFloat, name : String) {
        
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

    
    
    
}

