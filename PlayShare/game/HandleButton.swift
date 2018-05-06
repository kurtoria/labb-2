//
//  Button.swift
//  PlayShare
//
//  Created by Victoria Grönqvist on 2018-05-04.
//  Copyright © 2018 Victoria Grönqvist. All rights reserved.
//

import UIKit
import SpriteKit

protocol HandleButtonDelegate : class {
    func spriteNodeButtonPressed (_ button : HandleButton)
}

class HandleButton: SKSpriteNode {
    weak var delegate : HandleButtonDelegate?
    var bColor : UIColor = UIColor(red: 136/255.0, green: 255/255.0, blue: 255/255.0, alpha: 0.8)
    var bSize : CGSize
    
    init(delegate : HandleButtonDelegate) {
        self.delegate = delegate
        bSize = CGSize(width: 100, height: 30)
        super.init(texture: nil, color: bColor, size: bSize)
    }
    
    init() {
        bSize = CGSize(width: 100, height: 30)
        super.init(texture: nil, color: bColor, size: bSize)
    }
    
    init(color: UIColor, size: CGSize) {
        self.bColor = color
        self.bSize = size
        super.init(texture: nil, color: color, size: size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func touchDown(atPoint pos : CGPoint) {
        alpha = 0.5
        if contains(pos) {
            delegate?.spriteNodeButtonPressed(self)
            print("Position: \(pos)")
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches {
            if parent != nil {
                self.touchDown(atPoint: t .location(in: parent!))
            }
        }
    }
    
    func disableOrEnableButton(player : Player, condition : Bool) {
        player.sprite.isUserInteractionEnabled = condition
        print("\(player.name)'s button are enable: \(condition)")
    }
    
    func disableOrEnableButtons(array : [Player], condition : Bool) {
        for p in array {
            p.sprite.isUserInteractionEnabled = condition
            print("\(p.name)'s button are enable: \(condition)")
        }
    }
    
    func changeColorAllButtons(players : [Player], color : UIColor) {
        for p in players {
            changeColor(player: p, color: color)
        }
    }
    
    func changeColor(player : Player, color : UIColor) {
        player.sprite.color = color
    }
    
}


