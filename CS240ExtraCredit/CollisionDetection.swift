//
//  CollisionDetection.swift
//  CS240ExtraCredit
//
//  Created by Fupduck Central MBP on 3/23/15.
//  Copyright (c) 2015 Existential Music. All rights reserved.
//

import Cocoa

class CollisionDetection: NSObject {
    private var numberOfCollisions = 0
    private var averageProbability = 0.0
    private var numberPermutations = ""
    
    func getData() -> (collisions: Int, permutations: String, average: Double) {
        return (numberOfCollisions, numberPermutations, averageProbability)
    }
    
    
    func chanceOfNoCollision(n: Int, r: Int, numberOfTests: Int) {
        if n <= 20 {
            numberPermutations = "\(factorialInt(n))"
        } else {
            numberPermutations = "Very large (64 bit Int overflow)"
        }
        var permutation:[Int] = []
        for index in 1...n {
            permutation.append(index)
        }
        var results = [Double]()
        var collisions = [Int]()
        for testNumber in 1...numberOfTests {
            var numCollisions = 0
            var permutations:[[Int]] = [[]]
            for perm in 0..<r {
                var len = n
                for i in 0..<len {
                    var randomValue = Int(arc4random_uniform(UInt32(len - i)))
                    var temp = permutation[i]
                    permutation[i] = permutation[randomValue]
                    permutation[randomValue] = temp
                }
                permutations.append(permutation)
            }
            for (index, value) in enumerate(permutations) {
                if value.count != 0 {
                    for (subIndex, subValue) in enumerate(value) {
                        if subIndex+1 == subValue {
                            numCollisions++
                            break
                        }
                    }
                }
            }
            collisions.append(numCollisions)
            results.append(1.0 - (Double(numCollisions) / Double(r)))
        }
        var averages = averageResults(results, collisionResults: collisions)
        numberOfCollisions = averages.averageNumberOfCollisions
        averageProbability = averages.averageProbability
    }
    
    private func averageResults (results: [Double], collisionResults: [Int]) ->(averageProbability: Double, averageNumberOfCollisions: Int) {
        var averageResult:Double = 0.0
        var averageCollide: Int = 0
        for index in 0..<results.count {
            averageCollide = averageCollide + collisionResults[index]
            averageResult = averageResult + results[index]
        }
        return (averageResult / Double(results.count), averageCollide / collisionResults.count)
    }
    
    private func factorialInt(var n: Int) -> Int {
        if n <= 20 {
            var returnVal = 1
            for i in 1...n {
                returnVal *= i
            }
            return returnVal
        }
        return n
    }
    
}
