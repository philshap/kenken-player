//
//  Matrix.swift
//  kenken player
//
//  Created by Phil Shapiro on 8/16/14.
//  Copyright (c) 2014 Phil Shapiro. All rights reserved.
//

import Foundation

// Adapted from an example in "The Swift Programming Lanaguge".

struct Matrix<T> {
    let rows: Int, columns: Int
    var grid: [T]

    init(rows: Int, columns: Int, initializer: () -> T) {
        self.rows = rows
        self.columns = columns
        grid = Array<T>(count: rows * columns, repeatedValue: initializer());
        for i in 0..<rows {
            for j in 0..<columns {
                self[i, j] = initializer();
            }
        }
    }
    func indexIsValidForRow(row: Int, column: Int) -> Bool {
        return row >= 0 && row < rows && column >= 0 && column < columns
    }
    subscript(row: Int, column: Int) -> T {
        get {
            assert(indexIsValidForRow(row, column: column), "Index out of range")
            return grid[(row * columns) + column]
        }
        set {
            assert(indexIsValidForRow(row, column: column), "Index out of range")
            grid[(row * columns) + column] = newValue
        }
    }
}