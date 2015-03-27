//
//  Calculations.swift
//  CS240ExtraCredit
//
//  Created by Fupduck Central MBP on 3/27/15.
//  Copyright (c) 2015 Existential Music. All rights reserved.
//

import Cocoa

struct Calculations {
    static var actualProbability = ""
    static var numberPermutations = ""
    static let eConstant = 0.3678794411714423215955237701614608674458111310317678
    
    //  Calculates n! up to 20! (Any n > 20 would result in 64 bit Int overflow)
    static func factorialInt(var n: Int) -> Int {
        if n <= 20 {
            var returnVal = 1
            for i in 1...n {
                returnVal *= i
            }
            return returnVal
        }
        return n
    }
    
    static func calculateActualProbability(n: Int) -> String{
        var actual = 1.0
        for k in 1...n {
            actual = actual + pow(-1.0, Double(k))/Double(Calculations.factorialInt(k))
        }
        return "\(actual)"
    }
    
    static func averageResults (#results: [Double], collisionResults: [Int]) ->(averageProbability: Double, averageNumberOfCollisions: Int) {
        var averageResult:Double = 0.0
        var averageCollide: Int = 0
        for index in 0..<results.count {
            averageCollide = averageCollide + collisionResults[index]
            averageResult = averageResult + results[index]
        }
        return (averageResult / Double(results.count), averageCollide / collisionResults.count)
    }

}
