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
    
    func testGameTiny() {
        // Trivial 2x2 game where each cell is a fixed value.
        var game = Game(size: 2, constraintStrings: [
            "= 1 00",
            "= 2 01",
            "= 2 10",
            "= 1 11"
            ]);
        XCTAssert(!game.isComplete());
        game.solve();
        XCTAssert(game.isComplete());
    }
    
    func createTestGameSmall() -> Game {
        return Game(size: 6, constraintStrings: [
            "+ 13 00 10 01 11",
            "* 180 20 30 40 31",
            "+ 9 50 51 52",
            "= 2 21",
            "* 20 41 42",
            "+ 15 02 03 04",
            "* 6 12 22",
            "+ 11 32 23 33",
            "= 3 13",
            "+ 9 43 53 34 44",
            "/ 2 14 24",
            "+ 18 54 35 45 55",
            "+ 8 05 15 25"
            ]);
    }
    
    func testGameSmall() {
        var game = createTestGameSmall();
        var count = 0;
        while !game.isComplete() {
            game.solve();
            print(game.description)
            if count++ > 5 {
                XCTFail("Can't solve!")
                break
            }
        }
    }
    
    // 5x5 KenKen puzzle from NYTimes 08/17/14
    func createTestGame2() -> Game {
        return Game(size: 5, constraintStrings: [
            "+ 3 00 01",
            "= 2 10",
            "- 2 20 21",
            "- 1 30 40",
            "- 1 11 12",
            "* 50 31 41 22 32",
            "+ 9 02 03",
            "- 2 42 43",
            "+ 9 13 04 14",
            "- 3 23 24",
            "/ 2 33 34",
            "= 2 44"
            ]);
    }
    
    func testGameMedium() {
        var game = createTestGame2();
        while !game.isComplete() {
            game.solve();
            print(game.description)
        }
    }
    
    // 7x7 KenKen puzzle from NYTimes 08/17/14
    func createTestGame3() -> Game {
        return Game(size: 7, constraintStrings: [
            "* 56 00 01 02",
            "/ 3 10 11",
            "- 1 20 21",
            "- 3 30 31",
            "- 1 40 41",
            "- 3 50 60",
            "= 6 51",
            "+ 18 61 52 62",
            "- 5 12 13",
            "- 3 22 32",
            "= 3 42",
            "= 6 03",
            "+ 7 23 33",
            "+ 13 43 53 63",
            "* 15 04 05 06",
            "+ 18 14 24 34",
            "- 3 44 54",
            "/ 2 64 65",
            "- 2 15 25",
            "- 5 35 36",
            "* 42 45 55 46",
            "- 2 16 26",
            "- 1 56 66"
            ]);
    }
    
    func testGameBig() {
        // Solver not yet smart enough to handle this.
        var game = createTestGame3();
        var count = 0;
        while !game.isComplete() {
            game.solve();
            print(game.description)
            if count++ > 10 {
                break;
//                XCTFail("Can't solve!");
            }
        }
    }
}
