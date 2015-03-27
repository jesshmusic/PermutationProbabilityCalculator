//
//  ViewController.swift
//  CS240ExtraCredit
//
//  Created by Fupduck Central MBP on 3/23/15.
//  Copyright (c) 2015 Existential Music. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    
    @IBOutlet weak var nTextField: NSTextField!
    @IBOutlet weak var rTextField: NSTextField!
    @IBOutlet weak var resultTextField: NSTextField!
    @IBOutlet weak var numberCollisionsTextField: NSTextField!
    @IBOutlet weak var permutationsTextField: NSTextField!
    @IBOutlet weak var numberOfTestsTextField: NSTextField!
    @IBOutlet weak var progressIndicator: NSProgressIndicator!
    @IBOutlet weak var runTestButton: NSButton!
    @IBOutlet weak var actualProbabilityTextField: NSTextField!
    @IBOutlet weak var maxDeviationTextField: NSTextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        progressIndicator.hidden = true
        nTextField.becomeFirstResponder()
        // Do any additional setup after loading the view.
    }
    
    override var representedObject: AnyObject? {
        didSet {
            // Update the view, if already loaded.
        }
    }
    
    @IBAction func runTest(sender: AnyObject) {
        var n = 5
        var r = 500
        var numberOfTests = 5
        
        /*
        *   Get user input from text fields
        */
        if nTextField.stringValue != "" {
            n = nTextField.integerValue
        }
        if rTextField.stringValue != "" {
            r = rTextField.integerValue
        }
        if numberOfTestsTextField.stringValue != "" {
            numberOfTests = numberOfTestsTextField.integerValue
        }
        if n <= 20 {
            Calculations.numberPermutations = "\(Calculations.factorialInt(n))"
            Calculations.actualProbability = Calculations.calculateActualProbability(n)
        } else {
            Calculations.numberPermutations = "64 bit Int overflow!"
            Calculations.actualProbability = "\(Calculations.eConstant)"
        }
        
        /*
        *   Run Tests
        */
        runPermutationTest(numberOfElements: n, numberOfRandomPermutations: r, numberOfTests: numberOfTests, sender: sender)

    }
    
    private func runPermutationTest(numberOfElements n: Int, numberOfRandomPermutations r: Int, numberOfTests: Int, sender: AnyObject) {
        // Progress Indicator start
        progressIndicator.hidden = false
        progressIndicator.startAnimation(sender)

        // Create arrays to hold the resulting permutions and collisions
        var results = [Double]()
        var collisions = [Int]()
        for testNumber in 1...numberOfTests {
            var detectionResults = CollisionDetection.chanceOfNoCollision(numberOfElements: n, numberOfRandomPermutaions: r)
            collisions.append(detectionResults.numCollisions)
            results.append(detectionResults.result)
        }
        var averages = Calculations.averageResults(results: results, collisionResults: collisions)
        
        // Display Test Results
        resultTextField.stringValue = "\(averages.averageProbability)"
        numberCollisionsTextField.stringValue = "\(averages.averageNumberOfCollisions)"
        permutationsTextField.stringValue = Calculations.numberPermutations
        actualProbabilityTextField.stringValue = Calculations.actualProbability
        maxDeviationTextField.stringValue = "\(abs(averages.averageProbability - Calculations.eConstant))"
        
        // Progress Indicator stop
        progressIndicator.stopAnimation(sender)
        progressIndicator.hidden = true
        
    }
    
}

