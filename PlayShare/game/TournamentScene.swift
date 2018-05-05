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

class TournamentScene : SKScene, HandleButtonDelegate {
    
    var originalPlayers = TournamentViewController.seguedPlayers
    var model : TournamentModel = TournamentModel(players: TournamentViewController.seguedPlayers)
    var y0 = 598.0
    var y1 = 560.0
    var x01 = 60.0
    //var x0 = 0.0
    //var x1 = 0.0
    var evenY : Double = 0.0
    var oddY : Double = 0.0
    
    
    override func didMove(to view: SKView) {
        
        if model.isFirstRound() {
            model.firstRound = false
            print("Number of players in TournamentScene: \(model.originalPlayers.count)")
            evenY = y0 - 95
            oddY = y1 - 95
            
            
            model.originalPlayers.shuffle()
            setUpPlayers(array: model.originalPlayers)
            model.oddOrNot()
            print("Players length: \(model.players.count)")
            
            //place first players
            placePlayers(y0: y0, y1: y1, x: x01, array: model.players)
     
            //DO THINGS. LOTSA THINGS WHOLE GEEEEMEE
            //model.connectAllPlayers()
            model.filteredPlayer.sprite.isHidden = true
            }
        /*
            if model.filteredPlayer.oddPlayer == true {
                print("Goes into oddplayers")
                //placeOddRound()
                setUpOddPlayer()
                model.filteredPlayer.sprite.isHidden = true
            }
        */
    }
    
    
    func startNewRound() {
        print("Goes into new round")
        //model.moveArrays()
        setUpPlayers(array: model.players)
        print("Players count: \(model.players.count)")
        x01 = x01 + 110
        placePlayers(y0: y0, y1: y1, x: x01, array: model.players)
    }
    
    func setUpPlayers(array : [Player]) {
        for p in array {
            p.sprite = HandleButton(delegate: self)
            addChild(p.sprite)
            p.sprite.isUserInteractionEnabled = true
            p.wonGame = false
            p.oddPlayer = false
            print("Name: \(p.name)")
        }
    }
    
    func placePlayers(y0 : Double, y1 : Double, x : Double, array: [Player]) {
        var i = 0
        for (index, p) in array.enumerated()/*model.players.enumerated()*/ {
            let sum = index % 2
            
            if i == 0 {
                placeFirstRoundPlayer(yPos: y0, xPos: x, p: p, index: index)
                i += 1
                print("I is: \(i)")
            } else if i == 1 {
                placeFirstRoundPlayer(yPos: y1, xPos: x, p: p, index: index)
                i += 1
            } else {
                //print("Goes into else")
                placeRest(index: index, /*sum: sum,*/ x: x, p: p)
                /*
                if index % 2 == 0 {
                    
                    print("Sum: \(sum)")
                    placeFirstRoundPlayer(yPos: evenY, xPos: x, p: p, index: index)
                    print("Number in if modulus: \(index)")
                    evenY = evenY - 95
                } else {
                    print("Sum: \(sum)")
                    placeFirstRoundPlayer(yPos: oddY, xPos: x, p: p, index: index)
                    print("Number in else else: \(index)")
                    oddY = oddY - 95
                }
                */
            }
        }
    }
    
    func placeRest(index : Int, /*sum : Int,*/ x : Double, p : Player) {
        print("Goes into else")
        if index % 2 == 0 {
            
            //print("Sum: \(sum)")
            placeFirstRoundPlayer(yPos: evenY, xPos: x, p: p, index: index)
            print("Number in if modulus: \(index)")
            evenY = evenY - 95
        } else {
            //print("Sum: \(sum)")
            placeFirstRoundPlayer(yPos: oddY, xPos: x, p: p, index: index)
            print("Number in else else: \(index)")
            oddY = oddY - 95
        }
    }
    
    func placeFirstRoundPlayer(yPos : Double, xPos : Double, p : Player, index : Int) {
        //p.sprite.position = CGPoint(x: 60.0, y: yPos)
        //createTextForButtons(name: p.name, pos: p.sprite.position)
        //print("\(index), Position for \(p.name) is \(p.sprite.position).")
        placeSinglePlayer(xPos: xPos, yPos: yPos, p: p, index: index)
    }
    
    func placeSinglePlayer(xPos : Double, yPos : Double, p : Player, index : Int) {
        p.sprite.position = CGPoint(x: xPos, y: yPos)
        //var button = HandleButton()
        //button.createTextForButtons(name: p.name, pos: p.sprite.position)
        createTextForButtons(name: p.name, pos: p.sprite.position)
        print("\(index), Position for \(p.name) is \(p.sprite.position).")
    }
    
    //--------------------ODD funcs-------------------------------------------
    
    func setUpOddPlayer() {
        
        model.connectOddRound(randomPlayer: model.getRandomPlayer(array: model.winners), filteredPlayer: model.filteredPlayer)
        /*
        for p in model.players {
            p.wonGame = false
        }
        */
        model.players = []
        print("setUpOddPlayer, model.player.count: \(model.players.count)")
        model.players = model.oddRoundPlayers
        for p in model.players {
            print("setUpOddPlayer, model.player.count: \(model.players.count), name: \(p.name)")
        }
        //model.oddRoundPlayers = []
        print("setUpOddPlayer, oddRoundPlayers: \(model.players.count)")


        
        setUpPlayers(array: /*model.oddRoundPlayers*/ model.players)
        
        for p in model.players {
            print("VIKTIGT, name: \(p.name), PlayersArray.count: \(model.players.count)")
        }
        for p in model.oddRoundPlayers {
            print("VIKTIGT, name: \(p.name), OddArray.count: \(model.oddRoundPlayers.count)")
        }
        for p in model.winners {
            print("VIKTIGT, name: \(p.name), WinnersArray.count: \(model.winners.count)")
        }
        for p in model.losers {
            print("VIKTIGT, name: \(p.name), LoserArray.count: \(model.losers.count)")
        }
        
        model.winners = []
        
        for p in model.winners {
            print("VIKTIGT, name: \(p.name), WinnersArray.count: \(model.winners.count)")
        }
        
        //model.filteredPlayer.oddPlayer = false
        //Ta bort filtered player
        /*
        model.players = []
        model.players = model.oddRoundPlayers
        model.oddRoundPlayers = []
         */
        
    }
    
    func placeOddRound() {
        model.filteredPlayer.sprite.isHidden = false
        for (index, p) in model.oddRoundPlayers.enumerated() {
            print("\(index), Odd Round players name: \(p.name)")
            //placeSinglePlayer(xPos: x01 + 120.0, yPos: y0, p: p, index: index)
            
            //placeSinglePlayer(xPos: x01, yPos: evenY - 95, p: p, index: index)
            y0 = y1
            placeRest(index: index, x: x01, p: p)
            model.players.append(p)
        }
        model.oddRoundPlayers = []
    }
    
    //-----------------Buttons-----------------------------------------------
    
    func createTextForButtons(name : String, pos : CGPoint) {
        let newPos = pos.y - 6
        let buttonText = SKLabelNode(fontNamed: "Arial")
        buttonText.text = name
        buttonText.fontSize = 20
        buttonText.fontColor = SKColor.black
        buttonText.position = pos
        buttonText.position.y = newPos
        self.addChild(buttonText)
        
    }
    
    //MARK: - HandleButtonDelegate
    func spriteNodeButtonPressed(_ button: HandleButton) {
        
        print("We are in the scene")
        print("Player pressed: ")
        for p in model.players {
            if button.position == p.sprite.position {
                print("Same pos for \(button.position) and \(p.name)")
                p.wonGame = true
                if let a = model.players.index(of: p) {
                    let array = model.connectTwoPlayerss(i: a)
                    model.makePlayerUnavailable(array: array, player: p)
                    //model.checkMoved(array: model.players, winArray: model.winners)
                }
                //model.addPlayerToWinner(p: p)
                print("Player won game: \(p.wonGame)")
            } else {
                print("Not same position")
            }
            
            
            if model.players.count == model.winners.count * 2 {
                button.disableOrEnableButtons(array: model.players, condition: false)
                
                if model.filteredPlayer.oddPlayer == true {
                    print("Status filteredPlayer.oddPlayer: \(model.filteredPlayer.oddPlayer)")
                    
                    setUpOddPlayer()
                    placeOddRound()
                } else {
                    model.moveArrays()
                    if model.players.count > 1 {
                        startNewRound()
                    } else {
                        print("YOU WON U VITCH")
                    }
                }
            }
 
        }
    }
}

