//
//  JShape.swift
//  Swiftris
//
//  Created by Mac Admin on 5/12/15.
//  Copyright (c) 2015 BG. All rights reserved.
//

class JShape: Shape {
    /*
    zero: 
    * |0|
      |1|
    |3|2|
    
    ninety: 
    
    |3*|
    |2 | 1 | 0 |
    
    oneEighty:
    2*| 3
    1 |
    0 |
    
    TwoSeventy
    
    0*| 1 | 2
          | 3
    */
    
    override var blockRowColumnPositions: [Orientation : Array <(columnDiff:Int, rowDiff:Int)>] {
        return [
            Orientation.zero : [(1, 0), (1, 1), (1, 2), (0, 2)],
            Orientation.Ninety : [(2, 1), (1, 1), (0, 1), (0, 0)],
            Orientation.OneEighty : [(0, 2), (0, 1), (0, 0), (1, 0)],
            Orientation.TwoSeventy :[(0, 0), (1, 0), (2, 0), (2, 1)]
        ]
    }
    
    override var bottomBlocksForOrientations: [Orientation : Array<Block>] {
        return [
            Orientation.zero : [blocks[ThirdBlockIdx] , blocks[FourthBlockIdx]],
            Orientation.Ninety : [blocks[FirstBlockIdx], blocks[SecondBlockIdx], blocks[ThirdBlockIdx]],
            Orientation.OneEighty : [blocks[FirstBlockIdx], blocks[FourthBlockIdx]],
            Orientation.TwoSeventy : [blocks[FirstBlockIdx],blocks[SecondBlockIdx],blocks[FourthBlockIdx]]
        ]
    }
 }
