//
//  TShape.swift
//  Swiftris
//
//  Created by Mac Admin on 5/10/15.
//  Copyright (c) 2015 BG. All rights reserved.
//

class TShape: Shape {
    
    /*
    zero :
      | 0 |
    1 | 2 | 3
    
    ninety :
      | 1 |
      | 2 | 0
      | 3 |
    
    oneEighty
      
    1 | 2 | 3
      | 0 |
    
    twoSeventy
      | 1 |
    0 | 2 |
      | 3 |
    */
    
    //MARK: possible future problems with these coordinates
    override var blockRowColumnPositions: [Orientation : Array<(columnDiff: Int, rowDiff: Int)>] {
        return [
            Orientation.zero : [(1 , 0) , (0 , 1) , (1 , 1) , (2 , 1)],
            Orientation.Ninety : [(2 , 1) , (1, 0) , (1, 1), (1, 2)],
            Orientation.OneEighty : [(1, 2) , (0, 1), (1, 1), (2, 1)],
            Orientation.TwoSeventy : [(0, 1) , (1, 0), (1, 1) , (1, 2)]
        ]
    }
    
    override var bottomBlocksForOrientations: [Orientation: Array<Block>] {
        return [
            Orientation.zero : [blocks[SecondBlockIdx] , blocks[ThirdBlockIdx] , blocks[FourthBlockIdx]],
            Orientation.Ninety : [blocks[FirstBlockIdx] , blocks[FourthBlockIdx]],
            Orientation.OneEighty : [blocks[FirstBlockIdx], blocks[SecondBlockIdx] , blocks[FourthBlockIdx]],
            Orientation.TwoSeventy : [blocks[FirstBlockIdx], blocks[FourthBlockIdx]]
            ]
    }
}
