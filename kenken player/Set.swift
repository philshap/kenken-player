//
//  Set.swift
//  kenken player
//
//  Created by Phil Shapiro on 8/16/14.
//  Copyright (c) 2014 Phil Shapiro. All rights reserved.
//

import Foundation

/** Basic Set type */
public struct Set<T: Hashable> : SequenceType {
    var contents = [T: Bool]();
    
    public init() {
    }
    
    public func contains(value:T) -> Bool {
        return contents[value] != nil;
    }
    
    public mutating func insert(value:T) {
        contents[value] = true;
    }
    
    public mutating func remove(value:T) {
        contents[value] = nil;
    }
    
    public func size() -> Int {
        return contents.count;
    }

    public func first() -> T? {
        for (key, value) in contents {
            return key;
        }
        return nil;
    }
    
    public func generate() -> GeneratorOf<T> {
        var contentsGenerator = contents.generate();
        return GeneratorOf<T>({ () -> T? in
            if let (key, _) = contentsGenerator.next() {
                return key;
            }
            return nil;
        })
    }

    public func display() {
        print("[");
        for value in self {
            print("\(value) ");
        }
        print("]");
    }
    
    /** Modify this set to be an intersection of the current set's contents with the other set. */
    public mutating func intersect(other:Set<T>) {
        for value in self {
            if !other.contains(value) {
                remove(value);
            }
        }
    }
}