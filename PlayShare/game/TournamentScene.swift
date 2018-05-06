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
    var viewController : UIViewController!
    var originalPlayers = TournamentViewController.seguedPlayers
    var model : TournamentModel = TournamentModel(players: TournamentViewController.seguedPlayers)
    var cam : SKCameraNode?
    var upperCenterPoint : CGPoint = CGPoint(x: 0.0, y: 0.0)
    var y0 = 0.0
    var y1 = 0.0
    var x01 = 0.0
    var evenY : Double = 0.0
    var oddY : Double = 0.0
    var tempWinners : [Player] = []
   
    override func didMove(to view: SKView) {
        y0 = 598.0
        y1 = 560.0
        x01 = 60.0
        evenY = 0.0
        oddY = 0.0
        
        if originalPlayers.isEmpty {
            originalPlayers = getPlayersReturn()
        }
        
        setupCameraNode()
        if model.isFirstRound() {
            setUpFirstRound()
        }
    }
    
    //---------------------------------------Set up's---------------------------------------------------
    
    //Sets up camera node that helps with placing center in rounds
    func setupCameraNode() {
        cam = SKCameraNode()
        self.camera = cam
        self.addChild(cam!)
    }
    
    //Set up first round with set x and y values
    func setUpFirstRound() {
        model.firstRound = false
        evenY = y0 - 95
        oddY = y1 - 95
        model.originalPlayers.shuffle()
        setUpPlayers(array: model.originalPlayers)
        model.oddOrNot(array: model.originalPlayers)
        placePlayers(y0: y0, y1: y1, x: x01, array: model.players)
        model.filteredPlayer.sprite.isHidden = true
    }
    
    func setUpPlayers(array : [Player]) {
        for p in array {
            p.sprite = HandleButton(delegate: self)
            addChild(p.sprite)
            p.sprite.isUserInteractionEnabled = true
            p.wonGame = false
            p.oddPlayer = false
            print("setUpPlayers: Name: \(p.name)")
        }
    }

    func startNewRound() {
        model.emptyWinners()
        setUpPlayers(array: model.players)
        model.oddOrNot(array: model.players)
        x01 = x01 + 110
        evenY = y0 - 95
        oddY = y1 - 95
        placePlayers(y0: y0, y1: y1, x: x01, array: model.players)
    }
    
    //-------------------------------------Placing players---------------------------------------------------
    
    func setUpperPos() {
        let upperPlayerPoint = CGPoint(x: model.players[0].sprite.position.x, y: model.players[0].sprite.position.y - 270)
        upperCenterPoint = upperPlayerPoint
    }
    
    func placePlayers(y0 : Double, y1 : Double, x : Double, array: [Player]) {
        var i = 0
        for (index, p) in array.enumerated() {
            if i == 0 {
                placeFirstRoundPlayer(yPos: y0, xPos: x, p: p, index: index)
                setUpperPos()
                i += 1
            } else if i == 1 {
                placeFirstRoundPlayer(yPos: y1, xPos: x, p: p, index: index)
                i += 1
            } else {
                placeRest(index: index, x: x, p: p)
            }
        }
    }
    
    func placeRest(index : Int, x : Double, p : Player) {
        
        if index % 2 == 0 {
            placeFirstRoundPlayer(yPos: evenY, xPos: x, p: p, index: index)
            evenY = evenY - 95
        } else {
            placeFirstRoundPlayer(yPos: oddY, xPos: x, p: p, index: index)
            oddY = oddY - 95
        }
    }
    
    func placeFirstRoundPlayer(yPos : Double, xPos : Double, p : Player, index : Int) {
        placeSinglePlayer(xPos: xPos, yPos: yPos, p: p, index: index)
    }
    
    func placeSinglePlayer(xPos : Double, yPos : Double, p : Player, index : Int) {
        p.sprite.position = CGPoint(x: xPos, y: yPos)
        createTextForButtons(name: p.name, pos: p.sprite.position)
    }
    
    //---------------------------------------ODD funcs---------------------------------------------------
    
    //Sets upp odd/random player and random player
    func setUpOddPlayer() {
        model.filteredPlayer.oddPlayer = false
        model.connectOddRound(randomPlayer: model.getRandomPlayer(array: model.winners), filteredPlayer: model.filteredPlayer)
        model.players = []
        model.players = model.oddRoundPlayers
        setUpPlayers(array: model.players)
        print("SETUPODDPLAYER: winners..count: \(model.winners.count)")
        if model.winners.count > 1 {
            for w in model.winners {
                tempWinners.append(w)
            }
        } else {
            model.winners = []
        }
    }
    
    //Places odd round
    func placeOddRound() {
        model.filteredPlayer.sprite.isHidden = false
        for (index, p) in model.oddRoundPlayers.enumerated() {
            y0 = y1
            placeRest(index: index, x: x01, p: p)
            model.players.append(p)
        }
        model.oddRoundPlayers = []
    }
    
    //---------------------------------------Buttons---------------------------------------------------
    
    //Creates text for the buttons
    func createTextForButtons(name : String, pos : CGPoint) {
        let newPos = pos.y - 6
        let buttonText = SKLabelNode(fontNamed: "Arial")
        buttonText.text = name
        buttonText.fontSize = 20
        buttonText.fontColor = SKColor.white
        buttonText.position = pos
        buttonText.position.y = newPos
        self.addChild(buttonText)
    }
    
    //MARK: - HandleButtonDelegate
    func spriteNodeButtonPressed(_ button: HandleButton) {
        for p in model.players {
            if button.position == p.sprite.position {
                print("Same pos for \(button.position) and \(p.name)")
                p.wonGame = true
                matchingPosAndPlayer(p: p)
            }
        }
        checkNumbersInWinnerArray(button: button)
    }
    
    func matchingPosAndPlayer(p : Player) {
        if let a = model.players.index(of: p) {
            print("spriteNodeButtonPressed: name: \(p.name), model.players.index: \(a)")
            let array = model.connectTwoPlayerss(i: a)
            model.makePlayerUnavailable(array: array, player: p)
        }
    }
    
    //Checks if there is halv as many winners as players, and acts accordingly
    func checkNumbersInWinnerArray(button : HandleButton) {
        if model.players.count == model.winners.count * 2 {
            fixButtons(button: button)
            if model.filteredPlayer.oddPlayer == true {
                setUpOddPlayer()
                placeOddRound()
                
            } else {
                whatNext()
            }
        }
    }
    
    //What will happen next, either new round or game done
    func whatNext() {
        model.moveArrays()
        for p in tempWinners {
            model.players.append(p)
        }
        if model.players.count > 1 {
            startNewRound()
        } else {
            alert()
        }
    }
    
    //Disable and color buttons from this/previous round
    func fixButtons(button : HandleButton) {
        button.disableOrEnableButtons(array: model.players, condition: false)
        button.changeColorAllButtons(players: model.players, color: UIColor(red: 0/255.0, green: 174/255.0, blue: 191/255.0, alpha: 0.8))
    }
    
    //---------------------------------------Other functions---------------------------------------------------
    
    //Handles position of camera
    override func update(_ currentTime: TimeInterval) {
        super.update(currentTime)
        if let camera = cam {
            camera.position = upperCenterPoint
        }
    }
    
    // play again with same players.
    func playAgain() {
        storeAndSavePlayers()
        let newViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Game")
        UIApplication.topViewController()?.present(newViewController, animated: true, completion: nil)
    }
    
    //Goes back to startview. #NOT DONE
    func backToStart() {
        let newViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Start")
        UIApplication.topViewController()?.present(newViewController, animated: true, completion: nil)
        //FIX THIS
    }
    
    //Moves around and saves players for playing again
    func storeAndSavePlayers() {
        model.moveAll()
        var names : [String] = []
        for p in model.originalPlayers {
            names.append(p.name)
        }
        savePlayersString(players: names)
    }
    
    //Alert that shows when one player won the game
    func alert() {
        let alertController = UIAlertController(title: "⚡️ \(model.winners[0].name) won! ⚡️", message: " Would you like to play again with the same set up?", preferredStyle: .alert)
        let yesButton = UIAlertAction(title: "Of course", style: .default, handler: { (confirmView) in
            self.playAgain()
        })
        let noButton = UIAlertAction(title: "Absolutely not", style: .default, handler: { (confirmView) in
            self.backToStart()
        })
        
        alertController.addAction(yesButton)
        alertController.addAction(noButton)
        self.viewController.present(alertController, animated: true, completion: nil)
    }
}

