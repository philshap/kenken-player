//
//  GameTest.swift
//  kenken player
//
//  Created by Phil Shapiro on 8/16/14.
//  Copyright (c) 2014 Phil Shapiro. All rights reserved.
//

import Cocoa
import XCTest
import kenken_player;

class GameTest: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    // Trivial 2x2 game where each cell is a fixed value.
    func createTestGame() -> Game {
        return Game(size: 2, constraints: [
            Constraint(Operator.Identity, 1, [ Position(column: 0, row: 0) ]),
            Constraint(Operator.Identity, 2, [ Position(column: 0, row: 1) ]),
            Constraint(Operator.Identity, 2, [ Position(column: 1, row: 0) ]),
            Constraint(Operator.Identity, 1, [ Position(column: 1, row: 1) ]),
            ]);
    }
    
    // KenKen puzzle from NYTimes 08/17/14
    func createTestGame2() -> Game {
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
    
    func testGame() {
        var game = createTestGame();
        XCTAssert(!game.isGameComplete());
        game.applyConstraints();
        XCTAssert(game.isGameComplete());
    }
    
    func testGameBig() {
        var game = createTestGame2();
        XCTAssert(!game.isGameComplete());
        for i in 0...10 {
            game.applyConstraints();
            game.display();
            game.excludeConstrainedValues();
            game.display();
        }
    }
}
