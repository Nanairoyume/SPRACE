//
//  GameViewController.swift
//  Sprace
//
//  Created by Ira Ricalde on 4/4/19.
//  Copyright © 2019 shaira. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    // start of application, controls which view to show first
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // get view
        if let view = self.view as! SKView? {
            // load menuScene
            if let menuScene = MenuScene(fileNamed: "MenuScene") {
                // set the scale mode to scale to fit the window
                menuScene.scaleMode = .aspectFill
                
                // present the scene
                view.presentScene(menuScene)
            }
        }
    }

    override var shouldAutorotate: Bool {
        return false
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
