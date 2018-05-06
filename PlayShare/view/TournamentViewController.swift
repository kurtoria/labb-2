//
//  TournamentViewController.swift
//  PlayShare
//
//  Created by Victoria Grönqvist on 2018-04-16.
//  Copyright © 2018 Victoria Grönqvist. All rights reserved.
//

import UIKit
import SpriteKit

class TournamentViewController: UIViewController {
    var tar : CGPoint?
    var players : [Player] = []
    static var seguedPlayers : [Player] = []
    
    let skView : SKView = {
        let view = SKView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        TournamentViewController.seguedPlayers = players
        setUpSavedPlayers()
        setupSKView()
    }

    func setupSKView() {
        view.addSubview(skView)
        skView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        skView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        skView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        skView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        
        let scene = TournamentScene()
        scene.scaleMode = .resizeFill
        skView.presentScene(scene)
        
        //To make it possible to use alerts
        scene.viewController = self
        
        skView.ignoresSiblingOrder = true
        scene.backgroundColor = UIColor.white
    }
    
    func setUpSavedPlayers() {
        if TournamentViewController.seguedPlayers.isEmpty {
            let stringArray = getPlayersReturnString()
            var newArray : [Player] = []
            for name in stringArray {
                let player = Player(name: name)
                newArray.append(player)
            }
            TournamentViewController.seguedPlayers = newArray
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
