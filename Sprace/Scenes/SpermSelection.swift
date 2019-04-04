//
//  SpermSelection.swift
//  Sprace
//
//  Created by Ira Ricalde on 4/4/19.
//  Copyright © 2019 shaira. All rights reserved.
//

import SpriteKit

class SpermSelection: SKScene {

    override func didMove(to view: SKView) {
        randomSperm()
        showSceneName()
    }
    
    // get current time and get it as seed
    func fetchRandomSeed() -> Int {
        // get date
        let date = Date()
        
        // get components of date through calendar
        let calendar = Calendar.current
    
        let seconds = calendar.component(.second, from: date)
        let minutes = calendar.component(.second, from: date)
        let hour = calendar.component(.second, from: date)
        
        // seed: seconds minutes hour
        let seedStr = "\(seconds)\(minutes)\(hour)"
        if let seed = Int(seedStr) {
            return seed
        }
        
        return 0
    }
    
    // function to get random sperm
    func randomSperm() {
        nextRand()
        
    }
    
    func nextRand() {
        // algorithm: middle square method
        
        // get seed base on time
        var seed = 0
        while(seed == 0) {
            seed = fetchRandomSeed()
        }
        print("Seed: \(seed)")
        
        // get count of seed
        let seedCount = String(seed).count
        print("Seed Count: \(seedCount)")
        
        // square seed
        let sqSeed = seed * seed
        let sqSeedStr = String(sqSeed)
        print("Squared Seed: \(sqSeed)")
        
        // get middle n digits
        let start = sqSeedStr.index(sqSeedStr.startIndex, offsetBy: ((seedCount / 2) + 1))
        let end = sqSeedStr.index(sqSeedStr.endIndex, offsetBy: -((seedCount / 2) + 1))
        let range = start..<end
        
        if let newSeed = Int(sqSeedStr[range]) {
            print("New Seed: \(newSeed)")
        }
        
    }
    
    // animations
    func showSceneName() {
        if let sceneNameOutline = self.childNode(withName: "sceneNameOutline") as? SKLabelNode,
            let subtitleOutline = self.childNode(withName: "subtitleOutline") as? SKLabelNode
        {
            // create action
            let sceneNameSlideUp = SKAction.move(to: CGPoint(x: sceneNameOutline.position.x, y: 400), duration: 0.5)
            let subtitleSlideUp = SKAction.move(to: CGPoint(x: subtitleOutline.position.x, y: 320), duration: 0.5)
            
            // run action
            sceneNameOutline.run(sceneNameSlideUp)
            subtitleOutline.run(subtitleSlideUp)
        }
    }
}
