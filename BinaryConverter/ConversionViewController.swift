//
//  ConversionViewController.swift
//  BinaryConverter
//
//  Created by Nicholas Virag Jr. on 2/10/18.
//  Copyright © 2018 Nicholas Virag Jr. All rights reserved.
//

import UIKit

class ConversionViewController: UIViewController {

    var numberToConvert: Double = 156
    
    @IBOutlet weak var decimalInput: UITextField!
    @IBOutlet weak var displayBinary: UILabel!
    
    @IBAction func sendToConverter(_ sender: Any) {
        let input = Double(decimalInput.text!)!
        numberToConvert = input
        createBinarySlots(numberToConvert)
        print("Hello :^) \(input)")
    }
    
    var binarySlots = [Double]()
    var binaryStep: Double = 0
    var binaryValue: String = ""
    var remainder: Double = 0
    var baseTwoPower: Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func powerOfTwo(_ power: Double) -> Void {
        binaryStep = pow(2, baseTwoPower)
    }
    
    func createBinarySlots(_ number: Double) -> Void {
        remainder = numberToConvert
        while binaryStep <= remainder {
            print("While \(binaryStep) <= \(remainder)")
            if !binaryStep.isEqual(to: 0.0) {
                binarySlots.append(binaryStep)
            }
            powerOfTwo(baseTwoPower)
            baseTwoPower += 1
        }
        print("All Done!")
        createBinaryValue(binarySlots)
    }
    
    func createBinaryValue(_ slots: [Double]) -> Void {
        print(slots)
        for slot in slots.reversed() {
            if remainder >= slot {
                binaryValue = binaryValue + "1"
                print("Compare \(remainder) and \(slot) and you get \(binaryValue)")
                displayBinary.text = binaryValue
                remainder = (remainder - slot)
            } else if remainder < slot {
                binaryValue = binaryValue + "0"
                print("Compare \(remainder) and \(slot) and you get \(binaryValue)")
                displayBinary.text = binaryValue
            }
        }
    }
    
//    func updateUI() {
//
//    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
