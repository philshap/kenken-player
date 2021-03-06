//
//  Constraint.swift
//  kenken player
//
//  Created by Phil Shapiro on 8/16/14.
//  Copyright (c) 2014 Phil Shapiro. All rights reserved.
//

import Foundation

/**
 * A constraint constists of an operator, a set of board positions and a goal value. A constraint is satisfied if the
 * goal value can be produced by applying the operator to the board contents at the specified positions.
 */
public class Constraint {
    let op:Operator;
    let goal:Int;
    public let positions:[Position];
    
    /**
     * Create a constraint, given an operator, goal and board positions.
     */
    public init(_ op:Operator, _ goal:Int, _ positions:[Position]) {
        self.op = op;
        self.goal = goal;
        self.positions = positions;
    }
    
    /**
     * Helper method to make a constraint.
     * Format is:
     *
     * O G PP PP PP ...
     *
     * O - operator
     *
     * G - goal number
     *
     * PP - position in row/column format
     */
    public init(_ string:String) {
        let components = string.componentsSeparatedByString(" ");
        self.op = Operator.fromString(components[0]);
        self.goal = components[1].toInt()!;
        var positions = [Position]();
        for position in components[2..<components.count] {
            let column = position[position.startIndex..<position.startIndex.successor()].toInt()!;
            let row = position[position.startIndex.successor()..<position.endIndex].toInt()!;
            positions.append(Position(column: column, row: row));
        }
        self.positions = positions;
    }
    
    /** Exclude identical values if they share the same row or column. */
    public func excludeValue(position1: Position, _ value1:Int, _ position2: Position, _ value2:Int) -> Bool {
        return (value1 == value2) && (position1.row == position2.row || position1.column == position2.column);
    }
    
    /** Exclude identical values if they share the same row or column. */
    public func excludeValue(position1: Position, _ value1: Int,
        _ position2: Position, _ value2 : Int,
        _ position3: Position, _ value3: Int) -> Bool {
            return excludeValue(position1, value1, position2, value2)
                || excludeValue(position1, value1, position3, value3)
                || excludeValue(position2, value2, position3, value3);
    }
    
    public func excludeValue(position1: Position, _ value1: Int,
        _ position2: Position, _ value2: Int,
        _ position3: Position, _ value3: Int,
        _ position4: Position, _ value4: Int) -> Bool {
            return excludeValue(position1, value1, position2, value2)
                || excludeValue(position1, value1, position3, value3)
                || excludeValue(position1, value1, position4, value4)
                || excludeValue(position2, value2, position3, value3)
                || excludeValue(position2, value2, position4, value4)
                || excludeValue(position3, value3, position4, value4);
    }

    // Here is how this works:
    // The inputs are the current possible values for the board positions.
    // For each position, create an empty set to contain the allowed values.
    // For each possible combination of inputs, does the result satify the constraint? If so, add those inputs
    // to the allowed set of values.
    // Once all combinations have been tested, set each positions' value to be the intersection of the current value with
    // the allowed values.
    /** Modify the board values to satisfy this constraint. */
    public func constrain(board:Board) {
        var allowed = [Value]();
        for _ in positions {
            allowed.append(Value());
        }
        switch positions.count {
        case 1:
            for value in board.getValueAt(positions[0]) {
                if op.apply(value) == goal {
                    allowed[0].addValue(value);
                }
            }
        case 2:
            let position1 = positions[0];
            let position2 = positions[1];
            for value1 in board.getValueAt(position1) {
                for value2 in board.getValueAt(position2) {
                    if !excludeValue(position1, value1, position2, value2) {
                        if op.apply(value1, value2) == goal || op.apply(value2, value1) == goal {
                            allowed[0].addValue(value1);
                            allowed[1].addValue(value2);
                        }
                    }
                }
            }
        case 3:
            let position1 = positions[0];
            let position2 = positions[1];
            let position3 = positions[2];
            for value1 in board.getValueAt(position1) {
                for value2 in board.getValueAt(position2) {
                    for value3 in board.getValueAt(position3) {
                        if !excludeValue(position1, value1, position2, value2, position3, value3) {
                            if op.apply(value1, value2, value3) == goal {
                                allowed[0].addValue(value1);
                                allowed[1].addValue(value2);
                                allowed[2].addValue(value3);
                            }
                        }
                    }
                }
            }
        case 4:
            let position1 = positions[0];
            let position2 = positions[1];
            let position3 = positions[2];
            let position4 = positions[3];
            for value1 in board.getValueAt(position1) {
                for value2 in board.getValueAt(position2) {
                    for value3 in board.getValueAt(position3) {
                        for value4 in board.getValueAt(position4) {
                            if !excludeValue(position1, value1, position2, value2, position3, value3, position4, value4) {
                                if op.apply(value1, value2, value3, value4) == goal {
                                    allowed[0].addValue(value1);
                                    allowed[1].addValue(value2);
                                    allowed[2].addValue(value3);
                                    allowed[3].addValue(value4);
                                }
                            }
                        }
                    }
                }
            }
        default:
            print("Can't have an operator with \(positions.count) arguments");
        }
        for i in 0..<positions.count {
            board.getValueAt(positions[i]).constrainTo(allowed[i]);
        }
    }
}