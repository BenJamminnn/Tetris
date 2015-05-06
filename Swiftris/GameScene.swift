//
//  GameScene.swift
//  Swiftris
//
//  Created by Mac Admin on 5/4/15.
//  Copyright (c) 2015 BG. All rights reserved.
//
import SpriteKit
import UIKit

let TickingLengthLevelOne: NSTimeInterval = NSTimeInterval(600)

class GameScene: SKScene {
    
    var tick:(() -> ())?
    var tickingLengthMillis = TickingLengthLevelOne
    var lastTick: NSDate?
    
    
    required init(coder aDecoder: NSCoder) {
        fatalError("NSCoder not supported")
    }
    
    override init(size: CGSize) {
        super.init(size: size)
        
        anchorPoint = CGPoint(x: 0, y: 1.0) //anchor scene in top left
        
        let background = SKSpriteNode(imageNamed: "background")
        background.position = CGPoint(x: 0, y: 0)
        addChild(background)
    }
    
    override func update(currentTime: NSTimeInterval) {
        if(lastTick == nil) {
            return
        }
        
        var timePassed = lastTick!.timeIntervalSinceNow * -1000.0
        if(timePassed > tickingLengthMillis) {
            lastTick = NSDate()
            tick?()
        }
        
    }
    
    func startTicking() {
        lastTick = NSDate()
    }
    
    func stopTicking() {
        lastTick = nil
    }

}
