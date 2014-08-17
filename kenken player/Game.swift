//
//  Game.swift
//  kenken player
//
//  Created by Phil Shapiro on 8/16/14.
//  Copyright (c) 2014 Phil Shapiro. All rights reserved.
//

import Foundation

// A Game is a Board and a set of Constraints. A game is played by running constraints to remove invalid values. Once
// all invalid values are removed, the board values will be fixed and the game is complete.
public struct Game {
    var board: Board;
    var constraints: [Constraint];
    
    public init(size: Int, constraints:[Constraint]) {
        board = Board(size: size);
        self.constraints = constraints;
        for constraint in constraints {
            constraint.constrain(board);
        }
    }
    
    public static func createTestGame() -> Game {
        return Game(size: 2, constraints: [
            Constraint(op: Operator.Identity, goal: 1, positions: [ Position(column: 0, row: 0) ]),
            Constraint(op: Operator.Identity, goal: 2, positions: [ Position(column: 0, row: 1) ]),
            Constraint(op: Operator.Identity, goal: 2, positions: [ Position(column: 1, row: 0) ]),
            Constraint(op: Operator.Identity, goal: 1, positions: [ Position(column: 1, row: 1) ]),
        ]);
    }
    
    public func display() {
        board.display();
    }
}