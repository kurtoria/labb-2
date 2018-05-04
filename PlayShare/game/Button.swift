//
//  Button.swift
//  PlayShare
//
//  Created by Victoria Grönqvist on 2018-05-04.
//  Copyright © 2018 Victoria Grönqvist. All rights reserved.
//

import UIKit
import SpriteKit

class Button: SKSpriteNode {
    
    /*
    func createTextForButtons(name : String, pos : CGPoint) {
        let newPos = pos.y - 6
        let buttonText = SKLabelNode(fontNamed: "Arial")
        buttonText.text = name
        buttonText.fontSize = 20
        buttonText.fontColor = SKColor.black
        buttonText.position = pos
        buttonText.position.y = newPos
        self.addChild(buttonText)
    }
 */
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("Touch began")
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("Touch ended")
    }
    

}


