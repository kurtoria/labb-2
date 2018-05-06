//
//  SaveTournament.swift
//  PlayShare
//
//  Created by Victoria Grönqvist on 2018-04-16.
//  Copyright © 2018 Victoria Grönqvist. All rights reserved.
//

import UIKit

var defaults = UserDefaults.standard
var playersDef : [Player] = []
var playersDefString : [String] = []
var defaultsString = UserDefaults.standard

func savePlayers(players : [Player]) {
    defaults.set(players, forKey: "players")
    for p in players {
        print("Name in savePlayers: \(p.name)")
    }
    print("Saved array.count: \(players.count)")
}

func getPlayers() {
    if let p = defaults.value(forKey: "players") as? [Player] {
        playersDef = p
        for p in playersDef {
            print("Name in getPlayers: \(p.name)")
        }
    } else {
        playersDef = []
        print("playersDefaults is empty")
    }
}

func getPlayersReturn() -> [Player] {
    if let p = defaults.value(forKey: "players") as? [Player] {
        playersDef = p
        for p in playersDef {
            print("Name in getPlayers: \(p.name)")
        }
    } else {
        playersDef = []
        print("playersDefaults is empty")
    }
    return playersDef
}





func savePlayersString(players : [String]) {
    defaultsString.set(players, forKey: "playersString")
    print("Saved array.count: \(players.count)")
}


func getPlayersReturnString() -> [String] {
    if let p = defaultsString.value(forKey: "playersString") as? [String] {
        playersDefString = p
    } else {
        playersDefString = []
        print("playersDefaults is empty")
    }
    return playersDefString
}



class SaveTournamentModel: NSObject {
    
    /*
    var playerData : [Player] = []
    //var data :
    var defaults = UserDefaults.standard
    
    
    func savePlayers(array : [Player]) {
        defaults.set(array, forKey: "players")
        defaults.synchronize()
        print("Saved array")
        
    }
    
    func getPlayers() -> [Player] {
        if let p = defaults.value(forKey: "players") as? [Player] {
            playerData = p
        } else {
            print("Data could not be fetched")
        }
        return playerData
    }
    
    func removeSavedArray() {
        defaults.removeObject(forKey: "playerKey")
        print("Deleted array")

    }
 */


    

}
