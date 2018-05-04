//
//  TournamentManager.swift
//  PlayShare
//
//  Created by Victoria Grönqvist on 2018-04-30.
//  Copyright © 2018 Victoria Grönqvist. All rights reserved.
//

import Foundation

class TournamentManager {
    private init() {}
    static let shared = TournamentManager()
    
    public func launch() {
        firstLaunch()
    }
    
    public func firstLaunch() {
        if !UserDefaults.standard.bool(forKey: "isFirstLaunch") {
            print("This is first launch")
            
            UserDefaults.standard.set(true, forKey: "isFirstLaunch")
            UserDefaults.standard.synchronize()
        }
    }
    
}
