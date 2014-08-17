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
    
    func testGame() {
        var game = Game.createTestGame();
        game.display();
        XCTAssert(!game.isGameComplete());
        game.applyConstraints();
        game.display();
        XCTAssert(game.isGameComplete());
    }
    
    func testGameBig() {
        var game = Game.createTestGame2();
        game.display();
        XCTAssert(!game.isGameComplete());
        game.applyConstraints();
        game.display();
    }
}
