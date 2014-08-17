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
        board = Board(size);
        self.constraints = constraints;
    }
    
    public static func createTestGame() -> Game {
        return Game(size: 2, constraints: [
            Constraint(Operator.Identity, 1, [ Position(column: 0, row: 0) ]),
            Constraint(Operator.Identity, 2, [ Position(column: 0, row: 1) ]),
            Constraint(Operator.Identity, 2, [ Position(column: 1, row: 0) ]),
            Constraint(Operator.Identity, 1, [ Position(column: 1, row: 1) ]),
        ]);
    }
    
    public func applyConstraints() {
        for constraint in constraints {
            constraint.constrain(board);
        }
    }
    
    public func isGameComplete() -> Bool {
        return board.solved();
    }
    
    public func display() {
        board.display();
    }
}