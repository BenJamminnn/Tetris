//
//  Block.swift
//  Swiftris
//
//  Created by Mac Admin on 5/6/15.
//  Copyright (c) 2015 BG. All rights reserved.
//

import SpriteKit

let numberOfColors: UInt32 = 6

enum BlockColor: Int, Printable {
    case Blue = 0, Orange, Purple, Red, Yellow, Green
    
    var spriteName: String {
        switch self {
        case .Orange:
            return "orange"
        case .Purple:
            return "purple"
        case .Red:
            return "red"
        case .Yellow:
            return "yellow"
        case .Green:
            return "green"
        case .Blue:
            return "blue"
        default:
            return ""
        }
    }
    
    var description: String {
        return self.spriteName
    }
    
    static func random() -> BlockColor {
        return BlockColor(rawValue: Int(arc4random_uniform(numberOfColors)))!
    }
}
