//
//  Set.swift
//  kenken player
//
//  Created by Phil Shapiro on 8/16/14.
//  Copyright (c) 2014 Phil Shapiro. All rights reserved.
//

import Foundation

/** Basic Set type */
public struct Set<T: Hashable> : SequenceType, Printable {
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
        contents.removeValueForKey(value)
    }
    
    public func size() -> Int {
        return contents.count;
    }

    public func first() -> T? {
        for (key, _) in contents {
            return key;
        }
        return nil;
    }
    
    public func generate() -> GeneratorOf<T> {
        var contentsGenerator = contents.generate();
        return GeneratorOf<T> {
            if let (key, _) = contentsGenerator.next() {
                return key;
            }
            return nil;
        }
    }

    public var description : String {
        var s = "[";
        for value in self {
            s += "\(value) ";
        }
        s += "]";
        return s;
    }
    
    /** Modify this set to be an intersection of the current set's contents with the other set. */
    public mutating func intersect(other:Set<T>) {
        // Need to do this in two loops; modifying a Dictionary while looping over it
        // generates a bad instruction error.
        var keysToDelete = [T]()
        for value in self {
            if !other.contains(value) {
                keysToDelete.append(value)
            }
        }
        for key in keysToDelete {
            remove(key)
        }
    }
}