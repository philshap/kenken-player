//
//  Board.swift
//  kenken player
//
//  Created by Phil Shapiro on 8/16/14.
//  Copyright (c) 2014 Phil Shapiro. All rights reserved.
//

import Foundation

// A Board is a matrix of values. Each value can be fixed or variable.
public class Board {
    var contents: Matrix<Value>;
    public let size: Int;

    public init(size:Int) {
        self.size = size;
        contents = Matrix<Value>(rows: size, columns: size, initializer: { Value(size: size); } )
    }
    
    // A board is solved if there are no unconstrained values left.
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
    
    // Return the list of non-fixed values for a row. These are the values that are not yet constrained.
    public func unconstrainedRowValues(row: Int) -> Value {
        var value = Value(size: size);
        for i in 0..<size {
            if let fixedvalue = contents[row, i].getValue() {
                value.removeValue(fixedvalue);
            }
        }
        return value;
    }
    
    public func unconstrainedColumnValues(column: Int) -> Value {
        var value = Value(size: size);
        for i in 0..<size {
            if let fixedvalue = contents[i, column].getValue() {
                value.removeValue(fixedvalue);
            }
        }
        return value;
    }
    
    public func getValueAt(position: Position) -> Value {
        return contents[position.row, position.column];
    }
    
    public func display() {
        for i in 0..<size {
            for j in 0..<size {
                contents[i, j].display();
            }
            println();
        }
    }
}