//
//  TetrisGame.swift
//  Swiftris
//
//  Created by Mac Admin on 5/13/15.
//  Copyright (c) 2015 BG. All rights reserved.
//

let numberOfColumns = 10
let numberOfRows = 20

let startingColumn = 4
let startingRow = 0

let previewColumn = 12
let previewRow = 1

class Tetris {
    var blockArray: Array2D<Block>
    var nextShape: Shape?
    var fallingShape: Shape?
    
    init() {
        self.nextShape = nil
        self.fallingShape = nil
        blockArray = Array2D(columns: numberOfColumns, rows: numberOfRows)
    }
    
    func beginGame() {
        if(nextShape == nil) {
            nextShape = Shape.randomShape(previewColumn, startingRow: previewRow)
        }
    }
    
    func newShape() -> (fallingShape: Shape? , nextShape: Shape?) {
        fallingShape = nextShape
        nextShape = Shape.randomShape(startingColumn, startingRow: startingRow)
        fallingShape?.moveTo(startingColumn, row: startingRow)
        return (fallingShape, nextShape) 
    }
}