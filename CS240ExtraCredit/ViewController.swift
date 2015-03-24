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
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        progressIndicator.hidden = true
        runTestButton.enabled = false
        nTextField.becomeFirstResponder()
        // Do any additional setup after loading the view.
    }
    
    override var representedObject: AnyObject? {
        didSet {
            // Update the view, if already loaded.
        }
    }

    @IBAction func editingChanged(sender: AnyObject) {
        if nTextField.stringValue == "" || rTextField.stringValue == "" || numberOfTestsTextField.stringValue == "" {
            runTestButton.enabled = false
        } else {
            runTestButton.enabled = true
        }
    }
    
    @IBAction func runTest(sender: AnyObject) {
        if nTextField.integerValue > 0 && rTextField.integerValue > 0 && numberOfTestsTextField.integerValue > 0 {
            let collisionDetector = CollisionDetection()
            let n = nTextField.integerValue
            let r = rTextField.integerValue
            let tests = numberOfTestsTextField.integerValue
            progressIndicator.hidden = false
            progressIndicator.startAnimation(sender)
            collisionDetector.chanceOfNoCollision(n, r: r, numberOfTests: tests)
            let data = collisionDetector.getData()
            resultTextField.stringValue = "\(data.average)"
            numberCollisionsTextField.stringValue = "\(data.collisions)"
            permutationsTextField.stringValue = data.permutations
            progressIndicator.stopAnimation(sender)
            progressIndicator.hidden = true
        } else {
            resultTextField.stringValue = "ERROR!"
        }
    }
    
}

