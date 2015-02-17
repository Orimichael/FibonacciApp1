//
//  ViewController.swift
//  FibonacciApp
//
//  Created by Ori's Air on 2/16/15.
//  Copyright (c) 2015 Thinkful. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var sequenceLength:UInt64 = 2
    var maxValue = 94
    
    var fibonacciVariable = FibonacciSequence(numberOfItemsInSequence: 2, includesZero: true)
    
    @IBOutlet weak var fibonacciTextView: UITextView!
    
    @IBOutlet weak var numbersInSequenceLabel: UILabel!
    
    @IBAction func includeZeroSwitch(sender: UISwitch) {
        // if switch is ON, the fibonacci Object instantiated above is set to have the includesZero property set to true and vice-versa. If switch is on, maximum value of slider will be 94, otherwise 93
        maxValue = sender.on ? 94: 93
        if sender.on {
            fibonacciVariable.includesZero = true
        } else {
           fibonacciVariable.includesZero = false
        }
    }
    
    @IBAction func numbersInSequenceSlider(sender: UISlider) {
        // The maximum value of the slider is established according to parameters above. THe length of the fibonacci sequence is captured by the slider and cast as a UInt64 which is displayed in appropriate label.
        sender.maximumValue = Float(maxValue)
        sequenceLength = UInt64(sender.value)
        numbersInSequenceLabel.text = "\(sequenceLength)"
    }
    
    @IBAction func updateTextField() {
        // The text field updates and displays the fibonacci sequence object's values array
        fibonacciVariable = FibonacciSequence(numberOfItemsInSequence: sequenceLength, includesZero: fibonacciVariable.includesZero)
        fibonacciTextView.text = fibonacciVariable.values.description
    }
    
    @IBAction func resetSequence() {
        // The fibonacci sequence is reinitialized to [0,1] or [1,1] depending on the switch status and displayed accordingly
        sequenceLength = 2
        fibonacciVariable.values = fibonacciVariable.initializeSequence(true)
        updateTextField()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.backgroundColor = UIColor.darkGrayColor()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}

