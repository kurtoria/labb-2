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


