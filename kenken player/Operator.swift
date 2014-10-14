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
    
    /**
     * Convenience constructor, maps the text version of an op to its value.
     */
    public static func fromString(op:String) -> Operator {
        switch op {
        case "=": return Identity;
        case "+": return Plus;
        case "-": return Minus;
        case "*": return Multiply;
        case "/": return Divide;
        default: return Identity;
        }
    }
    
    /**
     * Return the result of applying this op to a list of arguments. If the op fails or is
     * not appropriate for the number of arguments, return nil.
     */
    public func apply(args: Int...) -> Int? {
        switch self {
        case .Identity:
            if args.count == 1 {
                return args[0]
            }
            return nil
        case .Minus:
            if args.count == 2 {
                return args[0] - args[1]
            }
            return nil
        case .Divide:
            if args.count == 2 && args[0] % args[1] == 0 {
                // Only support exact divides.
                return args[0] / args[1]
            }
            return nil;
        case .Plus:
            if args.count < 2 {
                return nil;
            }
            var total = 0
            for arg in args {
                total += arg
            }
            return total
        case .Multiply:
            if args.count < 2 {
                return nil;
            }
            var sum = 1
            for arg in args {
                sum *= arg
            }
            return sum
        }
    }
}
