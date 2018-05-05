//
//  TournamentModel.swift
//  PlayShare
//
//  Created by Victoria Grönqvist on 2018-04-16.
//  Copyright © 2018 Victoria Grönqvist. All rights reserved.
//

import UIKit

class TournamentModel: NSObject {
    var handleButtons = HandleButton()
    
    var originalPlayers : [Player]
    var players : [Player] = []
    var winners : [Player] = []
    var losers : [Player] = []
    //var filteredPlayers : [Player] = []
    var filteredPlayer = Player(name: "")
    var oddRoundPlayers : [Player] = []
    var firstRound = true
    
    init(players : [Player]) {
        originalPlayers = players
    }
    
    //Returns true if it is first round
    func isFirstRound() -> Bool {
        if firstRound {
            return true
        } else {
            return false
        }
    }

    //-------------------Connect players between each other------------------------------
    
    
    func connectTwoPlayers(p1 : Player, p2 : Player) -> [Player] {
        let connectedPlayers = [p1, p2]
        print("Number in connected players arrays: \(connectedPlayers.count), 1st: \(connectedPlayers[0].name), 2nd: \(connectedPlayers[1].name)")
        return connectedPlayers
    }
 
    
    func connectTwoPlayerss(i : Int) -> [Player] {
        var coupled : [Player] = []
        if i % 2 == 0 {
            coupled = [players[i], players[i + 1]]
            print("Array count: \(coupled.count), \([players[i].name), \(players[i + 1].name)")
        } else {
            coupled = [players[i - 1], players[i]]
            print("Array count: \(coupled.count), \([players[i - 1].name), \(players[i].name)")
        }
        return coupled
    }
    
    
    //------------------------If one player pressed-------------------------
    
    
    func addPlayerToWinner(p : Player) {
        winners.append(p)
    }
    
    func addPlayerToLosers(p : Player) {
        losers.append(p)
    }

    func makePlayerUnavailable(array : [Player], player : Player) {
        for p in array {
            if p.wonGame {
                addPlayerToWinner(p: p)
                //checkMoved(array: players, winArray: winners)
                print("Winner: \(winners.count), name: \(p.name)")
            } else {
                //Vad som händer med den andra spelaren som inte blev nertryckt
                addPlayerToLosers(p: p)
                var button = HandleButton()
                button.disableOrEnableButton(player: p, condition: false)
                
                print("Loser: \(losers.count), name: \(p.name)")
            }
        }
    }
    
    func checkMoved(array : [Player], winArray : [Player]) {
        let result = winArray.count * 2
        if array.count == result {
            print("winArray*2: \((winArray.count * 2)) = array.count: \(array.count)")
            
            //#warning put in movement
            handleButtons.disableOrEnableButtons(array: players, condition: false)
            moveArrays()
            
            
            
            
        } else {
            print("array.count ain't the same as winArray.count * 2")
            print("Result: \((winArray.count * 2)) = \(array.count)")
        }
    }
    
    func moveArrays() {
        players = []
        for p in winners {
            players.append(p)
            print("PlayerArray: \(players.count)")
        }
        winners = []
        print("Winners: \(winners.count)")
        
        
    }
    
    //--------------------ODD funcs-------------------------------------------
    
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
                filteredPlayer.oddPlayer = true
                print("Filtered player: \(filteredPlayer.name), odd: \(filteredPlayer.oddPlayer)")
            }
            originalPlayers.remove(at: originalPlayers.endIndex - 1)
        }
        players = originalPlayers
        print("OriginalPlayers length: \(originalPlayers.count)")
    }
    
    func connectOddRound(randomPlayer : Player, filteredPlayer : Player) {
        oddRoundPlayers = connectTwoPlayers(p1: randomPlayer, p2: filteredPlayer)
        
    }
    
    func moveOddArrays() {
        players = []
        for p in winners {
            players.append(p)
            print("PlayerArray: \(players.count)")
        }
        winners = []
        print("Winners in oddMove: \(winners.count)")
        
    }
}
