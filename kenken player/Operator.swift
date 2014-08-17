//
//  File.swift
//  kenken player
//
//  Created by Phil Shapiro on 8/16/14.
//  Copyright (c) 2014 Phil Shapiro. All rights reserved.
//

import Foundation

public enum Operator {
    case Identity, Plus, Minus, Multiply, Divide;
   
    public func apply(arg1:Int) -> Int? {
        switch self {
        case .Identity:
            return arg1;
        default:
            return nil;
        }
    }
   
    public func apply(arg1:Int, _ arg2:Int) -> Int? {
        switch self {
        case .Identity:
            return nil;
        case .Plus:
            return arg1 + arg2;
        case .Minus:
            return arg1 - arg2;
        case .Multiply:
            return arg1 * arg2;
        case .Divide:
            return arg1 / arg2;
        }
    }

    public func apply(arg1:Int, _ arg2:Int, _ arg3:Int) -> Int? {
        switch self {
        case .Identity, .Minus, .Divide:
            return nil;
        case .Plus:
            return arg1 + arg2 + arg3;
        case .Multiply:
            return arg1 * arg2 * arg3;
        }
    }
}
