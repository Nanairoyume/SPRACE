//
//  MenuSceneController.swift
//  Sprace
//
//  Created by Ira Ricalde on 4/4/19.
//  Copyright © 2019 shaira. All rights reserved.
//

import SpriteKit

class MenuScene: SKScene {

    // init function
    override func didMove(to view: SKView) {
        
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
                let transition = SKTransition.flipHorizontal(withDuration: 0.5)
                
                // scene to transition to
                print("Start Button clicked!")
            } else if nodesTouched.first?.name == "questionButton" {
                
            } else if nodesTouched.first?.name == "settingsButton" {
                
            }
        }
        
    }
}
