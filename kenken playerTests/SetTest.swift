//
//  SetTest.swift
//  kenken player
//
//  Created by Phil Shapiro on 8/16/14.
//  Copyright (c) 2014 Phil Shapiro. All rights reserved.
//

import Cocoa
import XCTest
import kenken_player;

class SetTest: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testContains() {
        var set = Set<Int>();
        XCTAssert(!set.contains(10));
    }
    
    func testInsert() {
        var set = Set<Int>();
        set.insert(10);
        XCTAssert(set.contains(10));
        set.insert(100);
        XCTAssert(set.contains(100));
    }
    
    func testRemove() {
        var set = Set<Int>();
        set.insert(10);
        set.remove(10);
        XCTAssert(!set.contains(10));
    }
    
    func testSize() {
        var set = Set<Int>();
        XCTAssertEqual(set.size(), 0);
        set.insert(10);
        XCTAssertEqual(set.size(), 1);
        set.insert(10);
        XCTAssertEqual(set.size(), 1);
        set.insert(11);
        XCTAssertEqual(set.size(), 2);
        set.remove(10);
        set.remove(11);
        XCTAssertEqual(set.size(), 0);
    }
    
    func testFirst() {
        var set = Set<Int>();
        XCTAssertNil(set.first());
        set.insert(10);
        XCTAssertEqual(set.first()!, 10);
        set.remove(10);
        XCTAssertNil(set.first());
    }
    
    func testIntersect() {
        var set1 = Set<Int>();
        set1.insert(1);
        set1.insert(2);
        set1.insert(3);

        var set2 = Set<Int>();
        set2.insert(2);
        set2.insert(3);
        set2.insert(4);
        
        set1.intersect(set2);
        
        XCTAssert(!set1.contains(1));
        XCTAssert(set1.contains(2));
        XCTAssert(set1.contains(3));
        XCTAssert(!set1.contains(4));
    }
    
    func testIntersect2() {
        var set1 = Set<Int>();
        for i in 1...4 {
            set1.insert(i);
        }
        var set2 = Set<Int>();
        set2.insert(3);
        
        set1.intersect(set2);
        
        XCTAssert(set1.size() == 1);
        XCTAssert(set1.contains(3));
    }
    
    func testGenerate() {
        var set = Set<Int>();
        set.insert(1);
        set.insert(2);
        set.insert(3);
        var dictionary = [Int: Bool]();
        for value in set {
            dictionary[value] = true;
        }
        XCTAssert(dictionary[1]!);
        XCTAssert(dictionary[2]!);
        XCTAssert(dictionary[3]!);
    }
}
