//
//  GameViewController.swift
//  Swiftris
//
//  Created by Mac Admin on 5/4/15.
//  Copyright (c) 2015 BG. All rights reserved.
//

import UIKit
import SpriteKit



class GameViewController: UIViewController {

    var scene:GameScene!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let skView = view as SKView!
        skView.multipleTouchEnabled = false
        
        scene = GameScene(size: skView.bounds.size)
        scene.scaleMode = .AspectFill
        
        skView.presentScene(scene)
    }

    override func shouldAutorotate() -> Bool {
        return true
    }

    override func prefersStatusBarHidden() -> Bool {
        return true
    }
}
