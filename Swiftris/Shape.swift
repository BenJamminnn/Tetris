//
//  Shape.swift
//  Swiftris
//
//  Created by Mac Admin on 5/6/15.
//  Copyright (c) 2015 BG. All rights reserved.
//

import SpriteKit

let numberOfOrientations: UInt32 = 4


enum Orientation: Int, Printable {
    case zero = 0, Ninety, OneEighty, TwoSeventy
    
    var description: String {
        switch self {
        case zero:
            return "0"
        case Ninety:
            return "90"
        case OneEighty:
            return "180"
        case TwoSeventy:
            return "270"
        default:
            return ""
        }
    }
        
    static func random() -> Orientation {
        return Orientation(rawValue: Int(arc4random_uniform(numberOfOrientations)))!
    }
        
    static func rotate(orientation: Orientation, clockWise: Bool) -> Orientation {
        var rotated = orientation.rawValue + (clockWise ? 1 : -1)
        if rotated > Orientation.TwoSeventy.rawValue {
            rotated = Orientation.zero.rawValue
        } else if rotated < 0 {
            rotated = Orientation.TwoSeventy.rawValue
        }
        
        return Orientation(rawValue: rotated)!
    }
}


//Constants for shape class
let numShapeTypes: UInt32 = 7 //different poss shapes

//Shape indexes, each block within the shape will have an index
let FirstBlockIdx: Int = 0
let SecondBlockIdx: Int = 1
let ThirdBlockIdx: Int = 2
let FourthBlockIdx: Int = 3

//Shape will be an abstract type

class Shape: Hashable, Printable {
    
    //vars
    let color: BlockColor
    
    var blocks = Array<Block>()
    
    var orientation: Orientation
    
    var column: Int, row: Int
    
    //computed vars...
    //defines a computed dict, mapping orientation to a tuple, subclasses will override this
    var blockRowColumnPositions: [Orientation: Array<(columnDiff: Int, rowDiff: Int)>] {
        return [:]
    }
    
    var bottomBlocksForOrientations: [Orientation: Array<Block>] {
        return [:]
    }
    
    var bottomBlocks:Array<Block> {
        if let bottomBlocks = bottomBlocksForOrientations[orientation] {
            return bottomBlocks
        }
        return []
    }
    
    
    //Hashable
    var hashValue: Int {
        return reduce(blocks, 0) {      //iterates throught the blocks array,
            $0.hashValue ^ $1.hashValue
        }
    }
    
    //Printable
    var description: String {
        return "\(color) block facing \(orientation) : \(blocks[FirstBlockIdx]), \(blocks[SecondBlockIdx]), \(blocks[ThirdBlockIdx]),\(blocks[FourthBlockIdx])"
    }
    
    
    //initializers
    init(column: Int, row: Int, color: BlockColor, orientation: Orientation) {
        self.column = column
        self.row = row
        self.color = color
        self.orientation = orientation
        self.initializeBlocks()
    }
    
    convenience init(column: Int, row: Int) {   //must always call down to a standard initializer
        self.init(column: column, row: row, color: BlockColor.random(), orientation: Orientation.random())
    }
    
    //convienience
    final func initializeBlocks() {
        if let blockColumnRowTranslations = blockRowColumnPositions[orientation] {
            for i in 0..<blockColumnRowTranslations.count {
                let blockRow = row + blockColumnRowTranslations[i].rowDiff
                let blockCol = column + blockColumnRowTranslations[i].columnDiff
                let newBlock = Block(column: blockCol, row: blockRow, color: color)
                blocks.append(newBlock)
            }
        }
    }

    /*
    @discussion - initialize blocks
    ->final == cannot be overridden by subclasses
    line 1: 
    the if let statement is equivilent to: 
    "let blockRowColumnTranslations = blockRowColumnPositions[orientations]
    if blockRowColumnTranslations != nil ....."
    the if let syntax implores optional binding, It takes an optional as an input
    and gives back a required constant if the optional is not nil
    */
}

//Equatable
func ==(lhs: Shape, rhs: Shape) -> Bool {
    return lhs.row == rhs.row   && lhs.column == rhs.column
}













