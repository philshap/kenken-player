//
//  OperatorTest.swift
//  kenken player
//
//  Created by Phil Shapiro on 8/17/14.
//  Copyright (c) 2014 Phil Shapiro. All rights reserved.
//

import Cocoa
import XCTest
import kenken_player;

class OperatorTest: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testApply1() {
        XCTAssertEqual(Operator.Identity.apply(100)!, 100);
        XCTAssertNil(Operator.Plus.apply(100));
    }
    
    func testApply2() {
        XCTAssertNil(Operator.Identity.apply(4, 2));
        XCTAssertEqual(Operator.Plus.apply(4, 2)!, 6);
        XCTAssertEqual(Operator.Minus.apply(4, 2)!, 2);
        XCTAssertEqual(Operator.Multiply.apply(4, 2)!, 8);
        XCTAssertEqual(Operator.Divide.apply(4, 2)!, 2);
        XCTAssertNil(Operator.Divide.apply(4, 3));
    }
    
    func testApply3() {
        XCTAssertNil(Operator.Identity.apply(1, 2, 3));
        XCTAssertEqual(Operator.Plus.apply(1, 2, 3)!, 6);
        XCTAssertNil(Operator.Minus.apply(1, 2, 3));
        XCTAssertEqual(Operator.Multiply.apply(1, 2, 3)!, 6);
        XCTAssertNil(Operator.Divide.apply(1, 2, 3));
    }
}
