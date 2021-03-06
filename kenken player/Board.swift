//
//  Board.swift
//  kenken player
//
//  Created by Phil Shapiro on 8/16/14.
//  Copyright (c) 2014 Phil Shapiro. All rights reserved.
//

import Foundation

/** A Board is a matrix of Values. Each value can be fixed or variable. */
public class Board : Printable {
    var contents: Matrix<Value>;
    /** The size of the board accross one dimension. A board is a square area. */
    public let size: Int;

    public init(_ size:Int) {
        self.size = size;
        contents = Matrix<Value>(rows: size, columns: size, initializer: { Value(size: size); } )
    }
    
    public func excludeFixedAt(valueRow: Int, _ valueColumn: Int, _ value: Int) {
        for row in 0..<size {
            if row != valueRow {
                contents[row, valueColumn].removeValue(value);
            }
        }
        for column in 0..<size {
            if column != valueColumn {
                contents[valueRow, column].removeValue(value);
            }
        }
    }
    
    public func excludeFixedCells() {
        for i in 0..<size {
            for j in 0..<size {
                if let value = contents[i, j].getValue() {
                    excludeFixedAt(i, j, value);
                }
            }
        }
    }
    
    /** A board is solved if there are no unconstrained values left. */
    public func solved() -> Bool {
        for i in 0..<size {
            for j in 0..<size {
                if !contents[i, j].isFixed() {
                    return false;
                }
            }
        }
        return true;
    }
    
    public func getValueAt(position: Position) -> Value {
        return contents[position.row, position.column];
    }
    
    public var description : String {
        var s = ""
        for i in 0..<size {
            for j in 0..<size {
                s += contents[i, j].description
            }
            s += "\n"
        }
        return s
    }
}