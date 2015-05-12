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

class Block: Hashable, Printable {

    //constants
    let color: BlockColor
    
    //properties
    var column: Int
    var row: Int
    var sprite: SKSpriteNode?
    
    var spriteName: String {
        return color.spriteName
    }
    
    var hashValue: Int {
        return self.column ^ self.row
    }
    
    var description: String {
        return "\(color): [\(column) , \(row)]"
    }
    
    init(column: Int, row: Int, color: BlockColor) {
        self.column = column
        self.row = row
        self.color = color
    }
    
}

func == (lhs: Block, rhs: Block) -> Bool {
    return lhs.column == rhs.column && lhs.row == rhs.row && lhs.color.rawValue == rhs.color.rawValue
}
