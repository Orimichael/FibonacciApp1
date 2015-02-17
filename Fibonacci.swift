//
//  Fibonacci.swift
//  FibonacciApp
//
//  Created by Ori's Air on 2/16/15.
//  Copyright (c) 2015 Thinkful. All rights reserved.
//

import Foundation

class FibonacciSequence
    
{
    
    var includesZero: Bool
    var values: [UInt64] = []
    
    init(maxNumber: UInt64, includesZero: Bool) {
        self.includesZero = includesZero
        initializeSequence(includesZero)
        // TO DO Create array with numbers that don't exceed maxNumber, taking into account includesZero parameter
        returnMaxSequence(maxNumber)
    }
    
    init(numberOfItemsInSequence:UInt64, includesZero: Bool) {
        self.includesZero = includesZero
        initializeSequence(includesZero)
        // TO DO Create array with numbers that don't exceed maxNumber, taking into account includesZero parameter
        returnItemsSequence(numberOfItemsInSequence)
    }
    
    func initializeSequence (includesZero: Bool) -> [UInt64] {
        if includesZero {
            values = [0, 1]
        } else {
            values = [1, 1]
        }
        return values
    }
    
    func returnMaxSequence (maxNumber:UInt64) -> [UInt64] {
        while values.last < maxNumber {
            let (sum, didOverflow) = UInt64.addWithOverflow(values.last!, values[values.count - 2])
            if didOverflow == true {
                println("Overflow! The next number is too big to store in a UInt64!")
                break
            }
            values += [values.last! + values[values.count - 2]]
        }
        if values.last > maxNumber {
            values.removeLast()
        }
        return values
    }
    
    func returnItemsSequence (numberOfItemsInSequence:UInt64) -> [UInt64] {
        for var i:UInt64 = 0; i < numberOfItemsInSequence-2; ++i {
            let (sum, didOverflow) = UInt64.addWithOverflow(values.last!, values[values.count - 2])
            if didOverflow == true {
                println("Overflow! The next number is too big to store in a UInt64!")
                break
            }
            values += [values.last! + values[values.count - 2]]
        }
        return values
    }
    
}
