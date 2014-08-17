//
//  ConstraintTest.swift
//  kenken player
//
//  Created by Phil Shapiro on 8/17/14.
//  Copyright (c) 2014 Phil Shapiro. All rights reserved.
//

import Cocoa
import XCTest
import kenken_player;

class ConstraintTest: XCTestCase {
    
    var board:Board = Board(1);

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        board = Board(5);
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testConstrainIdentity() {
        let position = Position(column: 1, row:1);
        var constraint = Constraint(Operator.Identity, 3, [position]);
        constraint.constrain(board);
        XCTAssert(!board.getValueAt(position).containsValue(2));
    }
    
    func testConstrainPlus2Arg() {
        let positions = [Position(column: 1, row:1), Position(column: 1, row:2)];
        
        var constraint = Constraint(Operator.Plus, 4, positions);
        constraint.constrain(board);
        // Ensure that value == 2 is not a valid solution, since the positions are on the same plane.
        for position in positions {
            let value = board.getValueAt(position);
            XCTAssert(value.containsValue(1));
            XCTAssert(!value.containsValue(2));
            XCTAssert(value.containsValue(3));
            XCTAssert(!value.containsValue(4));
            XCTAssert(!value.containsValue(5));
        }
    }
    
    func testConstrainMinus2Arg() {
        let positions = [Position(column: 1, row:1), Position(column: 1, row:2)];
        var constraint = Constraint(Operator.Minus, 3, positions);
        constraint.constrain(board);
        for position in positions {
            let value = board.getValueAt(position);
            XCTAssert(value.containsValue(1));
            XCTAssert(value.containsValue(2));
            XCTAssert(!value.containsValue(3));
            XCTAssert(value.containsValue(4));
            XCTAssert(value.containsValue(5));
        }
    }
    
    func testConstrainMultiply2Arg() {
        let positions = [Position(column: 1, row:1), Position(column: 1, row:2)];
        var constraint = Constraint(Operator.Multiply, 8, positions);
        constraint.constrain(board);
        for position in positions {
            let value = board.getValueAt(position);
            XCTAssert(!value.containsValue(1));
            XCTAssert(value.containsValue(2));
            XCTAssert(!value.containsValue(3));
            XCTAssert(value.containsValue(4));
            XCTAssert(!value.containsValue(5));
        }
    }
    
    func testConstrainDivide2Arg() {
        let positions = [Position(column: 1, row:1), Position(column: 1, row:2)];
        var constraint = Constraint(Operator.Divide, 3, positions);
        constraint.constrain(board);
        for position in positions {
            let value = board.getValueAt(position);
            XCTAssert(value.containsValue(1));
            XCTAssert(!value.containsValue(2));
            XCTAssert(value.containsValue(3));
            XCTAssert(!value.containsValue(4));
            XCTAssert(!value.containsValue(5));
        }
    }
    
    func testConstrainPlus3Arg() {
        let positions = [Position(column: 1, row:1), Position(column: 1, row:2), Position(column: 1, row: 3)];
        var constraint = Constraint(Operator.Plus, 6, positions);
        constraint.constrain(board);
        for position in positions {
            let value = board.getValueAt(position);
            XCTAssert(value.containsValue(1));
            XCTAssert(value.containsValue(2));
            XCTAssert(value.containsValue(3));
            XCTAssert(!value.containsValue(4));
            XCTAssert(!value.containsValue(5));
        }
    }
    
    func testConstrain3Arg() {
        
    }
}
