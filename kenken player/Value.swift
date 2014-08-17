//
//  Value.swift
//  kenken player
//
//  Created by Phil Shapiro on 8/16/14.
//  Copyright (c) 2014 Phil Shapiro. All rights reserved.
//

import Foundation

// A value represents the contents of a board location. Its value can be fixed, unknown, or constrained to a list of possible values.
public class Value {
    var values = Set<Int>();
    
    // Create a non-fixed value that contains all numbers in range 1 to size, inclusive.
    public init(size:Int) {
        for i in 1...size {
            values.insert(i);
        }
    }

    public init() {
    }

    public func isFixed() -> Bool {
        return values.size() == 1;
    }
    
    public func getValue() -> Int? {
        if isFixed() {
            return values.first();
        } else {
            return nil;
        }
    }
    
    public func containsValue(value:Int) -> Bool {
        return values.contains(value);
    }
    
    public func removeValue(value:Int) {
        values.remove(value);
    }
    
    public func addValue(value:Int) {
        values.insert(value);
    }

    // Further restrct this value's possible values based on the input constraints.
    public func constrainTo(constraints:Set<Int>) {
        values.intersect(constraints);
    }
    
    public func display() {
        values.display();
    }
}