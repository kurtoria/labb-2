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
    //@IBOutlet weak var skView: SKView!
    var tar : CGPoint?
    var players : [Player] = []
    static var seguedPlayers : [Player] = []
    
    let skkView : SKView = {
        let view = SKView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        TournamentViewController.seguedPlayers = players
        print("Number of segued players: \(TournamentViewController.seguedPlayers.count)")
        
        setupSKView()
    }
    
    func setupSKView() {
        view.addSubview(skkView)
        skkView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        skkView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        skkView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        skkView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        
        let scene = TournamentScene()
        scene.scaleMode = .fill
        skkView.presentScene(scene)
        skkView.ignoresSiblingOrder = true
        scene.backgroundColor = UIColor.white
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            tar = touch.location(in: view)
            if let t = tar {
                print("TournamentViewController: x is \(t.x), y is \(t.y)")
            }
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
