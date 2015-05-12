//
//  LineShape.swift
//  Swiftris
//
//  Created by Mac Admin on 5/12/15.
//  Copyright (c) 2015 BG. All rights reserved.
//



class LineShape: Shape {

    /*
    Orientations are only 0 and 180
    | 0 |
    | 1 |
    | 2 |
    | 3 |
    
    | 0 | 1 | 2 | 3 |
    */
    
    override var blockRowColumnPositions: [Orientation: Array<(columnDiff: Int, rowDiff: Int)>] {
        return [
            Orientation.zero : [(0, 0), (0, 1), (0, 2), (0, 3)],
            Orientation.Ninety : [(-1,0), (0, 0), (1, 0), (2, 0)],
            Orientation.OneEighty : [(0, 0), (0, 1), (0, 2), (0, 3)],
            Orientation.TwoSeventy : [(-1,0), (0, 0), (1, 0), (2, 0)]
        ]
    }
    
    override var bottomBlocksForOrientations: [Orientation : Array<Block>] {
        return [
            Orientation.zero : [blocks[FourthBlockIdx]],
            Orientation.Ninety : blocks,
            Orientation.OneEighty : [blocks[FourthBlockIdx]],
            Orientation.TwoSeventy : blocks
        ]
    }
    
}
