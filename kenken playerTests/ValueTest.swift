//
//  ValueTest.swift
//  kenken player
//
//  Created by Phil Shapiro on 8/16/14.
//  Copyright (c) 2014 Phil Shapiro. All rights reserved.
//

import Cocoa
import XCTest
import kenken_player;

class ValueTest: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testIsFixed() {
        var value = Value(size: 2);
        XCTAssert(!value.isFixed());
        var value2 = Value(size: 1);
        XCTAssert(value2.isFixed());
    }
    
    func testGetValue() {
        var value = Value(size: 2);
        XCTAssertNil(value.getValue());
        var value2 = Value(size: 1);
        XCTAssertEqual(value2.getValue()!, 1);
    }
    
    func testContainsValue() {
        var value = Value(size: 10);
        XCTAssert(value.containsValue(1));
        XCTAssert(value.containsValue(5));
        XCTAssert(value.containsValue(10));
        XCTAssert(!value.containsValue(0));
        XCTAssert(!value.containsValue(11));
    }
    
    func testRemoveValues() {
        var value = Value(size: 4);
        XCTAssert(value.containsValue(1));
        var toRemove = Set<Int>();
        toRemove.insert(1);
        value.removeValues(toRemove);
        XCTAssert(!value.containsValue(1));
    }
}
