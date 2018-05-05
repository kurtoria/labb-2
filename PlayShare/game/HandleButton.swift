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
    var bColor : UIColor
    var bSize : CGSize
    
    init(delegate : HandleButtonDelegate) {
        self.delegate = delegate
        bColor = UIColor.lightGray
        bSize = CGSize(width: 100, height: 30)
        //super.init(texture: nil, color: UIColor.lightGray, size: CGSize(width: 100, height: 30))
        super.init(texture: nil, color: bColor, size: bSize)
    }
    
    init() {
        bColor = UIColor.lightGray
        bSize = CGSize(width: 100, height: 30)
        //super.init(texture: nil, color: UIColor.lightGray, size: CGSize(width: 100, height: 30))
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
        print("Touch began")
        alpha = 0.5
        if contains(pos) {
            print("Touch down inside")
            delegate?.spriteNodeButtonPressed(self)
        } else {
            print("Touch down outside")
        }
    }
    
    func touchUp(atPoint pos : CGPoint) {
        print("Touch ended")
        
        alpha = 1.0
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches {
            if parent != nil {
                self.touchDown(atPoint: t .location(in: parent!))
                print("Touch begans parent is not nil")
            }
            //self.touchDown(atPoint: t.location(in: self))
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
 
    
    /*
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) -> Bool {
        if let touch = touches.first {
            let location = touch.location(in: self)
            print(location)
            
        }
    }
     */
    
    /*
     func createTextForButtons(name : String, pos : CGPoint) {
     let newPos = pos.y - 6
     let buttonText = SKLabelNode(fontNamed: "Arial")
     buttonText.text = n
     buttonText.fontSize = 20
     buttonText.fontColor = SKColor.black
     buttonText.position = pos
     buttonText.position.y = newPos
     self.addChild(buttonText)
     print("buttonText: \(buttonText.text)")
     }
     */
    
    /*
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches {
            self.touchUp(atPoint: t.location(in: self))
        }
    }
    */
    

}


