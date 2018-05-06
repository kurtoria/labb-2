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
        print("connectTwoPlayers: Number in connected players arrays: \(connectedPlayers.count), 1st: \(connectedPlayers[0].name), 2nd: \(connectedPlayers[1].name)")
        return connectedPlayers
    }
 
    
    func connectTwoPlayerss(i : Int) -> [Player] {
        var coupled : [Player] = []
        if i % 2 == 0 {
            coupled = [players[i], players[i + 1]]
            print("connectTwoPlayerss: Array count: \(coupled.count), names: \([players[i].name), \(players[i + 1].name)")
        } else {
            coupled = [players[i - 1], players[i]]
            print("connectTwoPlayerss: Array count: \(coupled.count), names: \([players[i - 1].name), \(players[i].name)")
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
            } else {
                //What happens with the other player that didn't got thir buttons pushed down
                addPlayerToLosers(p: p)
                let button = HandleButton()
                button.disableOrEnableButton(player: p, condition: false)
                
            }
        }
    }
    
    //--------------------ODD funcs-------------------------------------------
    
    func getRandomPlayer(array : [Player]) -> Player {
        let randomIndex = Int(arc4random_uniform(UInt32(array.count)))
        print("getRandomPlayer: Random player: \(array[randomIndex].name)")
        return array[randomIndex]
    }
    
    func ifOddPlayers(players : Int) -> Bool {
        if players % 2 == 0 {
            print("ifOddPlayers, true")
            return true
        } else {
            print("ifOddPlayers, false")
            return false
        }
    }
    
    func oddOrNot(array : [Player]) {
        var p = array
        if !ifOddPlayers(players: p.count) {

            if let last = p.last {
                filteredPlayer = last
                filteredPlayer.oddPlayer = true
            }
            p.remove(at: p.endIndex - 1)
        }
        players = p
    }
    
    func connectOddRound(randomPlayer : Player, filteredPlayer : Player) {
        oddRoundPlayers = connectTwoPlayers(p1: randomPlayer, p2: filteredPlayer)
    }
  
    //---------------------------------------Moving, deleting, adding players---------------------------------------------------

    func moveArrays() {
        players = []
        for p in winners {
            players.append(p)
            print("moveArrays: PlayerArray: \(players.count)")
        }
        print("moveArrays: Winners: \(winners.count)")
        print("moveArrays: Losers: \(losers.count)")
    }
    
    func moveAll() {
        originalPlayers = []
        for p in players {
            originalPlayers.append(p)
            print("Appended player: \(p.name)")
        }
        for l in losers {
            originalPlayers.append(l)
            print("Appended loser: \(l.name)")

        }
        winners = []
        players = []
        losers = []
    }
    
    func emptyWinners() {
        winners = []
    }
}



