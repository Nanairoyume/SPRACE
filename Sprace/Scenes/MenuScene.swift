//
//  MenuScene.swift
//  Sprace
//
//  Created by Ira Ricalde on 4/4/19.
//  Copyright © 2019 shaira. All rights reserved.
//

import SpriteKit

class MenuScene: SKScene {
    
    // init function
    override func didMove(to view: SKView) {
        animatePlayButton()
    }
    
    // detects beggining of each touch at start of event
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // get first touch, get its location, determine
        // if node under it is a button then execute respective function

        // get first touch
        let firstTouch = touches.first
        if let locationOfTouch = firstTouch?.location(in: self) { // get location of touch
            // get nodes under location of touch
            let nodesTouched = self.nodes(at: locationOfTouch)
            
            // determine which button is touched
            if nodesTouched.first?.name == "startButton" {
                // create transition for next scene
                let transition = SKTransition.flipVertical(withDuration: 0.5)
                
                // scene to transition to
                if let spermSelectionScene = SpermSelection(fileNamed: "SpermSelection") {
                    // present scene
                    spermSelectionScene.scaleMode = .aspectFill
                    self.view?.presentScene(spermSelectionScene, transition: transition)
                }
            } else if nodesTouched.first?.name == "questionButton" {
                
            } else if nodesTouched.first?.name == "settingsButton" {
                
            }
        }
        
    }
    
    // animations
    // scale play button
    func animatePlayButton() {
        // get button
        if let playButton = self.childNode(withName: "startButton") as? SKSpriteNode {
            // create scale action
            let scaleUp = SKAction.scale(to: CGSize(width: 720, height: 720), duration: 0.5)
            let scaleDown = SKAction.scale(to: CGSize(width: 680, height: 680), duration: 0.5)
            
            // create interval between actions
            let interval = SKAction.wait(forDuration: 0.5)
            
            // create sequence
            let scaleSeq = SKAction.sequence([scaleUp, scaleDown, interval])
            
            // create a repeating action using the sequence
            let scaleSeqRepeat = SKAction.repeatForever(scaleSeq)
            
            // run action
            playButton.run(scaleSeqRepeat)
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        
    }
}

