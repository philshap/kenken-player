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
    
    public static func createTestGame() -> Game {
        return Game(size: 2, constraints: [
            Constraint(Operator.Identity, 1, [ Position(column: 0, row: 0) ]),
            Constraint(Operator.Identity, 2, [ Position(column: 0, row: 1) ]),
            Constraint(Operator.Identity, 2, [ Position(column: 1, row: 0) ]),
            Constraint(Operator.Identity, 1, [ Position(column: 1, row: 1) ]),
        ]);
    }
    
    // KenKen puzzle from NYTimes 08/17/14
    public static func createTestGame2() -> Game {
        return Game(size: 5, constraints: [
            Constraint(Operator.Plus, 3, [ Position(column: 0, row: 0), Position(column: 0, row: 1) ]),
            Constraint(Operator.Identity, 2, [ Position(column: 1, row: 0) ]),
            Constraint(Operator.Minus, 2, [ Position(column: 2, row: 0), Position(column: 2, row: 1) ]),
            Constraint(Operator.Minus, 1, [ Position(column: 3, row: 0), Position(column: 4, row: 0) ]),
            Constraint(Operator.Minus, 1, [ Position(column: 1, row: 1), Position(column: 1, row: 2) ]),
            Constraint(Operator.Multiply, 50, [ Position(column: 3, row: 1), Position(column: 4, row: 1), Position(column: 2, row: 2) , Position(column: 3, row: 2) ]),
            Constraint(Operator.Plus, 9, [ Position(column: 0, row: 2), Position(column: 0, row: 3) ]),
            Constraint(Operator.Minus, 2, [ Position(column: 4, row: 2), Position(column: 4, row: 3) ]),
            Constraint(Operator.Plus, 9, [ Position(column: 1, row: 3), Position(column: 0, row: 4), Position(column: 1, row: 4) ]),
            Constraint(Operator.Minus, 3, [ Position(column: 2, row: 3), Position(column: 2, row: 4) ]),
            Constraint(Operator.Identity, 2, [ Position(column: 4, row: 4) ]),
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