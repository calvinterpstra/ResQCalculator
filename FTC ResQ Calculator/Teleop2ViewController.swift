//
//  Teleop2ViewController.swift
//  FTC ResQ Calculator
//
//  Created by block7 on 4/11/16.
//  Copyright © 2016 Calvin Terpstra. All rights reserved.
//

import UIKit

class Teleop2ViewController: UIViewController {
    
    
    @IBOutlet weak var teleopScoreLabel: UILabel!
    
    @IBOutlet weak var highZipSwitch: UISwitch!
    @IBOutlet weak var midZipSwitch: UISwitch!
    @IBOutlet weak var lowZipSwitch: UISwitch!
    @IBOutlet weak var highBucketStepper: UIStepper!
    @IBOutlet weak var midBucketStepper: UIStepper!
    @IBOutlet weak var lowBucketStepper: UIStepper!
    
    @IBOutlet weak var highBucketLabel: UILabel!
    @IBOutlet weak var midBucketLabel: UILabel!
    @IBOutlet weak var lowBucketLabel: UILabel!
    
    var backgroundTimer: NSTimer?
    
    var teleopScore: Int = 0
    
    var highDebrisScore: Int = 0
    var midDebrisScore: Int = 0
    var lowDebrisScore: Int = 0
    var ziplineTriggerScore: Int = 0
    
    let screenSize: CGRect = UIScreen.mainScreen().bounds
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundTimer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: "backgroundUpdate", userInfo: nil, repeats: true)
    }
    
    func backgroundUpdate(){
        scoreZiplineTriggers()
        debrisScoredHigh()
        debrisScoredMid()
        debrisScoredLow()
        
        updateScore()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //    @IBAction func doneEditing(sender: AnyObject) {
    //        view.endEditing(true)
    //    }
    
    func updateScore(){
        teleopScore = highDebrisScore + midDebrisScore + lowDebrisScore + ziplineTriggerScore
        teleopScoreLabel.text = "\(teleopScore)"
        
        Match.match.temporaryTarget2TeleopScore = teleopScore
    }
    
    func debrisScoredHigh(){
        highBucketLabel.text = "\((Int)(highBucketStepper.value))"
        highDebrisScore = (Int)(highBucketStepper.value) * 15
    }
    
    func debrisScoredMid(){
        midBucketLabel.text = "\((Int)(midBucketStepper.value))"
        midDebrisScore = (Int)(midBucketStepper.value) * 10
    }
    
    func debrisScoredLow(){
        lowBucketLabel.text = "\((Int)(lowBucketStepper.value))"
        lowDebrisScore = (Int)(lowBucketStepper.value) * 5
    }
    
    func scoreZiplineTriggers(){
        if(highZipSwitch.on && !midZipSwitch.on && !lowZipSwitch.on){
            ziplineTriggerScore = 20
        }
        else if(!highZipSwitch.on && midZipSwitch.on && !lowZipSwitch.on){
            ziplineTriggerScore = 20
        }
        else if(!highZipSwitch.on && !midZipSwitch.on && lowZipSwitch.on){
            ziplineTriggerScore = 20
        }
        else if((highZipSwitch.on && midZipSwitch.on) && !lowZipSwitch.on){
            ziplineTriggerScore = 40
        }
        else if(!highZipSwitch.on && (midZipSwitch.on && lowZipSwitch.on)){
            ziplineTriggerScore = 40
        }
        else if((highZipSwitch.on && lowZipSwitch.on) && !midZipSwitch.on){
            ziplineTriggerScore = 40
        }
        else if(highZipSwitch.on && lowZipSwitch.on && midZipSwitch.on){
            ziplineTriggerScore = 60
        }
        else {
            ziplineTriggerScore = 0
        }
    }
}
