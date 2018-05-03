//
//  TournamentModel.swift
//  PlayShare
//
//  Created by Victoria Grönqvist on 2018-04-16.
//  Copyright © 2018 Victoria Grönqvist. All rights reserved.
//

import UIKit

class TournamentModel: NSObject {
    //var model : TournamentModel = TournamentModel()
    //var scene : TournamentScene = TournamentScene()
    
    /*
    var originalPlayers = TournamentViewController.seguedPlayers
    var players : [Player] = []
    var winners : [Player] = []
    var losers : [Player] = []
    var filteredPlayers : [Player] = []
    var filteredPlayer = Player(name: "")
    */
    
    //var originalPlayers = TournamentViewController.seguedPlayers
    var originalPlayers : [Player]
    var players : [Player] = []
    var winners : [Player] = []
    var losers : [Player] = []
    var filteredPlayers : [Player] = []
    var filteredPlayer = Player(name: "")
    
    
    /*
    var y0 = 598.0
    var y1 = 560.0
    var evenY : Double = 0.0
    var oddY : Double = 0.0
    */
    var oddRoundPlayers : [Player] = []
    
    

    init(players : [Player]) {
        originalPlayers = players
    }

    /*
    func placePlayers(y0 : Double, y1 : Double) {
        var i = 0
        for (index, p) in players.enumerated() {
            let sum = index % 2
            
            if i == 0 {
                placeSinglePlayer(yPos: y0, p: p, index: index)
                i += 1
                print("I is: \(i)")
            } else if i == 1 {
                placeSinglePlayer(yPos: y1, p: p, index: index)
                i += 1
            } else {
                print("Goes into else")
                if index % 2 == 0 {
                    
                    print("Sum: \(sum)")
                    placeSinglePlayer(yPos: evenY, p: p, index: index)
                    print("Number in if modulus: \(index)")
                    evenY = evenY - 95
                } else {
                    print("Sum: \(sum)")
                    placeSinglePlayer(yPos: oddY, p: p, index: index)
                    print("Number in else else: \(index)")
                    oddY = oddY - 95
                }
            }
        }
    }
    
    func placeSinglePlayer(yPos : Double, p : Player, index : Int) {
        p.sprite.position = CGPoint(x: 60.0, y: yPos)
        scene.createTextForButtons(name: p.name, pos: p.sprite.position)
        print("\(index), Position for \(p.name) is \(p.sprite.position).")
    }
    */
    
    func getRandomPlayer(array : [Player]) -> Player {
        let randomIndex = Int(arc4random_uniform(UInt32(array.count)))
        print("Random player: \(array[randomIndex].name)")
        return array[randomIndex]
    }
    
    func ifOddPlayers(players : Int) -> Bool {
        if players % 2 == 0 {
            return true
        } else {
            return false
        }
    }
    
    func oddOrNot() {
        if !ifOddPlayers(players: originalPlayers.count) {
            print("Not even!")

            if let last = originalPlayers.last {
                filteredPlayer = last
                print("Filtered player: \(filteredPlayer.name)")
            }
            originalPlayers.remove(at: originalPlayers.endIndex - 1)
        }
        players = originalPlayers
        print("OriginalPlayers length: \(originalPlayers.count)")
    }
    
    func connectOddRound(randomPlayer : Player, filteredPlayer : Player) {
        oddRoundPlayers = [randomPlayer, filteredPlayer]
        
    }
    
    
    
}
