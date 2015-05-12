//
//  LShape.swift
//  Swiftris
//
//  Created by Mac Admin on 5/12/15.
//  Copyright (c) 2015 BG. All rights reserved.
//

class LShape: Shape {
    /*
    zero:
    |0*|
    |1|
    |2|3|
    
    ninety:
       *
    |2|1|0|
    |3|
    
    oneEighty:
    |3|2*|
      |1|
      |0|
    
    TwoSeventy:
    
       *|3|
    |0|1|2|
    */
    
    override var blockRowColumnPositions: [Orientation:Array<(columnDiff: Int, rowDiff: Int)>] {
        return [
            Orientation.zero : [(0,0) , (0,1) , (0,2) , (1, 2)],
            Orientation.Ninety : [(1,1) , (0 ,1) , (-1,1), (-1,2)],
            Orientation.OneEighty : [(0, 2) ,(0, 1) ,(0, 0) ,(-1, 0)],
            Orientation.TwoSeventy : [(-1, 1) ,(0, 1) ,(1, 1) ,(1, 0)]
        ]
    }
    
    override var bottomBlocksForOrientations : [Orientation: Array<Block>] {
        return [
            Orientation.zero :      [blocks[ThirdBlockIdx] , blocks[FourthBlockIdx]],
            Orientation.Ninety :    [blocks[FirstBlockIdx] , blocks[SecondBlockIdx], blocks[FourthBlockIdx]],
            Orientation.OneEighty : [blocks[FirstBlockIdx] , blocks[FourthBlockIdx]],
            Orientation.TwoSeventy: [blocks[FirstBlockIdx] , blocks[SecondBlockIdx], blocks[ThirdBlockIdx]]
        ]
    }
    
    
}
