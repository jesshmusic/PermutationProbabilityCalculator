//
//  CollisionDetection.swift
//  CS240ExtraCredit
//
//  Created by Fupduck Central MBP on 3/23/15.
//  Copyright (c) 2015 Existential Music. All rights reserved.
//

import Cocoa

struct CollisionDetection {
    
    static func chanceOfNoCollision(numberOfElements n: Int, numberOfRandomPermutaions: Int) -> (result: Double, numCollisions: Int) {
        // Create array of n in {1, 2,..., n}
        var permutation:[Int] = []
        for index in 1...n {
            permutation.append(index)
        }
        
        var numCollisions = 0
        var permutations:[[Int]] = [[]]
        for perm in 0..<numberOfRandomPermutaions {
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
        var newResult = 1.0 - (Double(numCollisions) / Double(numberOfRandomPermutaions))
        return (newResult, numCollisions)
    }
    
}
