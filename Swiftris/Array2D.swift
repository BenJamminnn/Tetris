//
//  Array2D.swift
//  Swiftris
//
//  Created by Mac Admin on 5/4/15.
//  Copyright (c) 2015 BG. All rights reserved.
//

class Array2D<T> {
    let columns: Int
    let rows: Int
    
    var array: Array<T?> //param T allows us to store any obj, making it remain a gen purpose tool
    
    init(columns: Int, rows: Int) {
        self.columns = columns
        self.rows = rows
        
        //create an array to hold the gameboard data
        array = Array<T?>(count: rows * columns, repeatedValue: nil)
        
    }
    
    subscript(column: Int, row: Int) -> T?{
        get {
            assert(self.indexIsValidForRow(row, column: column), "out of bounds")
            return array[(row * columns) + column]
        }
        
        set(newValue) {
            assert(self.indexIsValidForRow(row, column: column), "out of bounds")
            array[(row * columns) + column] = newValue
        }
    }
    
    func indexIsValidForRow(row: Int, column: Int) -> Bool  {
        return row >= 0 && row < rows && column >= 0 && column < columns
    }
    
}
