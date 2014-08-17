//
//  Value.swift
//  kenken player
//
//  Created by Phil Shapiro on 8/16/14.
//  Copyright (c) 2014 Phil Shapiro. All rights reserved.
//

import Foundation

/**
 * This class represents the contents of a board location. Its value is constrained to a list of possible values.
 * If there's only one possible value than its value is fixed.
 */
public class Value : SequenceType {
    var values = Set<Int>();
    
    /**
     * An initial Value is unconstrained and contains all numbers in range 1 to size, inclusive.
     */
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
    
    public func removeValues(toRemove:Set<Int>) {
        for value in toRemove {
            values.remove(value);
        }
    }
    
    public func addValue(value:Int) {
        values.insert(value);
    }

    /** Restrict this value's possible values based on the input constraints. */
    public func constrainTo(constraints:Value) {
        values.intersect(constraints.values);
    }
    
    public func display() {
        values.display();
    }

    public func generate() -> GeneratorOf<Int> {
        return values.generate();
    }
}