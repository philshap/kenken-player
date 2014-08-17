//
//  Constraint.swift
//  kenken player
//
//  Created by Phil Shapiro on 8/16/14.
//  Copyright (c) 2014 Phil Shapiro. All rights reserved.
//

import Foundation

// A constraint constists of an operator, a series of board positions and a goal value. A constraint is satisfied if the
// goal value can be produced by applying the operator to the board contents.
public class Constraint {
    let op:Operator;
    let goal:Int;
    let positions:[Position];
    
    // Initialize the board values corresponding to this constraint. The initial constraint includes
    // all values that are valid for this operator.
    init(op:Operator, goal:Int, positions:[Position]) {
        self.op = op;
        self.goal = goal;
        self.positions = positions;
    }
    
    public func constrain(board:Board) {
        var boardValues = [Value](count: positions.count, repeatedValue: Value());
        for i in 0..<positions.count {
            boardValues[i] = board.getValueAt(positions[i]);
        }
        constrain(boardValues, size: board.size);
    }

    // Modify the board values to satisfy this constraint.
    public func constrain(var boardValues:[Value], size:Int) {
        switch boardValues.count {
        case 1:
            for i in 1...size {
                if op.apply(i) != goal {
                    boardValues[0].removeValue(i);
                }
            }
        case 2:
            for i in 1...size {
                for j in 1...size {
                    if op.apply(i, arg2: j) != goal {
                        boardValues[0].removeValue(i);
                        boardValues[1].removeValue(j);
                    }
                }
            }
        case 3:
            for i in 1...size {
                for j in 1...size {
                    for k in 1...size {
                        if op.apply(i, arg2: j, arg3: k) != goal {
                            boardValues[0].removeValue(i);
                            boardValues[1].removeValue(j);
                            boardValues[2].removeValue(k);
                        }
                    }
                }
            }
        default:
            print("Can't have an operator with \(boardValues.count) arguments");
        }
    }
}