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
    
    func testGameTiny() {
        var game = createTestGame();
        XCTAssert(!game.isComplete());
        game.solve();
        XCTAssert(game.isComplete());
    }
    
    // 5x5 KenKen puzzle from NYTimes 08/17/14
    func createTestGame2() -> Game {
        return Game(size: 5, constraints: [
            Constraint("+ 3 00 01"),
            Constraint("= 2 10"),
            Constraint("- 2 20 21"),
            Constraint("- 1 30 40"),
            Constraint("- 1 11 12"),
            Constraint("* 50 31 41 22 32"),
            Constraint("+ 9 02 03"),
            Constraint("- 2 42 43"),
            Constraint("+ 9 13 04 14"),
            Constraint("- 3 23 24"),
            Constraint("/ 2 33 34"),
            Constraint("= 2 44")
            ]);
    }
    
    func testGameMedium() {
        var game = createTestGame2();
        while !game.isComplete() {
            game.solve();
            game.display();
        }
    }
    
    // 7x7 KenKen puzzle from NYTimes 08/17/14
    func createTestGame3() -> Game {
        return Game(size: 7, constraints: [
            Constraint("* 56 00 01 02"),
            Constraint("/ 3 10 11"),
            Constraint("- 1 20 21"),
            Constraint("- 3 30 31"),
            Constraint("- 1 40 41"),
            Constraint("- 3 50 60"),
            Constraint("= 6 51"),
            Constraint("+ 18 61 52 62"),
            Constraint("- 5 12 13"),
            Constraint("- 3 22 32"),
            Constraint("= 3 42"),
            Constraint("= 6 03"),
            Constraint("+ 7 23 33"),
            Constraint("+ 13 43 53 63"),
            Constraint("* 15 04 05 06"),
            Constraint("+ 18 14 24 34"),
            Constraint("- 3 44 54"),
            Constraint("/ 2 64 65"),
            Constraint("- 2 15 25"),
            Constraint("- 5 35 36"),
            Constraint("* 42 45 55 46"),
            Constraint("- 2 16 26"),
            Constraint("- 1 56 66")
            ]);
    }
    
    func testGameBig() {
        // Solver not yet smart enough to handle this.
        var game = createTestGame3();
        var count = 0;
        while !game.isComplete() {
            game.solve();
            game.display();
            if count++ > 10 {
                XCTFail("Can't solve!");
            }
        }
    }
}
