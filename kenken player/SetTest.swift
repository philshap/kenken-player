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
        assert(!set.contains(10));
    }
    
    func testInsert() {
        var set = Set<Int>();
        set.insert(10);
        assert(set.contains(10));
        set.insert(100);
        assert(set.contains(100));
    }
    
    func testRemove() {
        var set = Set<Int>();
        set.insert(10);
        set.remove(10);
        assert(!set.contains(10));
    }
    
    func testSize() {
        var set = Set<Int>();
        assert(set.size() == 0);
        set.insert(10);
        assert(set.size() == 1);
        set.insert(10);
        assert(set.size() == 1);
        set.insert(11);
        assert(set.size() == 2);
        set.remove(10);
        set.remove(11);
        assert(set.size() == 0);
    }
    
    func testFirst() {
        var set = Set<Int>();
        assert(set.first() == nil);
        set.insert(10);
        assert(set.first() == 10);
        set.remove(10);
        assert(set.first() == nil);
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
        
        assert(!set1.contains(1));
        assert(set1.contains(2));
        assert(set1.contains(3));
        assert(!set1.contains(4));
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
        assert(dictionary[1] == true);
        assert(dictionary[2] == true);
        assert(dictionary[3] == true);
    }
}
