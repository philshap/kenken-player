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
        assert(!value.isFixed());
        var value2 = Value(size: 1);
        assert(value2.isFixed());
    }
    
    func testGetValue() {
        var value = Value(size: 2);
        assert(value.getValue() == nil);
        var value2 = Value(size: 1);
        assert(value2.getValue() == 1);
    }
    
    func testContainsValue() {
        var value = Value(size: 10);
        assert(value.containsValue(1));
        assert(value.containsValue(5));
        assert(value.containsValue(10));
        assert(!value.containsValue(0));
        assert(!value.containsValue(11));
    }
    
    func testRemoveValue() {
        var value = Value(size: 4);
        assert(value.containsValue(1));
        value.removeValue(1);
        assert(!value.containsValue(1));
    }
}
