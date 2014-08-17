//
//  Game.swift
//  kenken player
//
//  Created by Phil Shapiro on 8/16/14.
//  Copyright (c) 2014 Phil Shapiro. All rights reserved.
//

import Foundation

/**
 * A Game is a Board and a set of Constraints. A game is played by running constraints to remove invalid values. Once
 * all invalid values are removed, the board values will be fixed and the game is complete.
 */
public struct Game {
    var board: Board;
    let constraints: [Constraint];
    
    public init(size: Int, constraints:[Constraint]) {
        board = Board(size);
        self.constraints = constraints;
    }
    
    public func applyConstraints() {
        for constraint in constraints {
            constraint.constrain(board);
        }
    }
    
    public func excludeIdenticalRowValues(row:Int, values:Set<Int>, atColumns: Set<Int>) {
        for column in 0..<board.size {
            if !atColumns.contains(column) {
                board.getValueAt(Position(column: column, row: row)).removeValues(values);
            }
        }
    }
    
    public func excludeIdenticalColumnValues(column:Int, values:Set<Int>, atRows: Set<Int>) {
        for row in 0..<board.size {
            if !atRows.contains(row) {
                board.getValueAt(Position(column: column, row: row)).removeValues(values);
            }
        }
    }
    
    /**
     * Exclude constrained values.
     * If a constraint is fully contained in a row or column, and if all possible values for all cells are the same
     * as its number of arguments, then its values can be removed from that row or column.
     *
     * For example, if a 2-argument constraint has the positions (0, 0), (0, 1) and both positions only have the values (1, 2) then
     * these values can be excluded from the other values in column 0.
     */
    public func excludeConstrainedValues() {
        // To avoid doing the same check multiple times, we could remove constraints once all their elements become fixed.
        // Similar logic could be used to convert a 3 arg constraint to a 2 arg one once one of its cells has been fixed.
        for constraint in constraints {
            var values = Set<Int>();
            var rows = Set<Int>();
            var columns = Set<Int>();
            for position in constraint.positions {
                rows.insert(position.row);
                columns.insert(position.column);
                for value in board.getValueAt(position) {
                    values.insert(value);
                }
            }
            // Only 1 cell per constraint argument.
            if values.size() == constraint.positions.count {
                if rows.size() == 1 {
                    // All cells are on the same row.
                    excludeIdenticalRowValues(rows.first()!, values: values, atColumns: columns);
                } else if columns.size() == 1 {
                    // All cells are on the same column.
                    excludeIdenticalColumnValues(columns.first()!, values: values, atRows: rows);
                }
            }
        }
    }
    
    public func isGameComplete() -> Bool {
        return board.solved();
    }
    
    public func display() {
        println();
        board.display();
    }
}