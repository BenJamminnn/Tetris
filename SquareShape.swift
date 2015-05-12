//
//  SquareShape.swift
//  Swiftris
//
//  Created by Mac Admin on 5/10/15.
//  Copyright (c) 2015 BG. All rights reserved.
//
class SquareShape: Shape {
    
    /*
    0 | 1
    2 | 3
    */
    let blockCoordinates: Array<(columnDiff: Int, rowDiff: Int)> = [(0,0) , (1, 0) , (0,1) , (1,1)]
    
    override var blockRowColumnPositions: [Orientation : Array<(columnDiff: Int, rowDiff: Int)>] {
        return [
            
            Orientation.zero : blockCoordinates ,
            Orientation.Ninety : blockCoordinates,
            Orientation.OneEighty : blockCoordinates,
            Orientation.TwoSeventy : blockCoordinates
        ]
    }
    
    override var bottomBlocksForOrientations: [Orientation : Array<Block>] {
        return [
            Orientation.zero : [blocks[ThirdBlockIdx], blocks[FourthBlockIdx]],
            Orientation.OneEighty : [blocks[ThirdBlockIdx], blocks[FourthBlockIdx]],
            Orientation.Ninety : [blocks[ThirdBlockIdx], blocks[FourthBlockIdx]],
            Orientation.TwoSeventy : [blocks[ThirdBlockIdx], blocks[FourthBlockIdx]]
        ]
    }
    
}
