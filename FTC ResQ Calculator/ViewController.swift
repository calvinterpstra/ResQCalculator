//
//  ViewController.swift
//  FTC ResQ Calculator
//
//  Created by block7 on 3/9/16.
//  Copyright © 2016 Calvin Terpstra. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var delegate: TableViewController?
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var highBucketTextField: UITextField!
    @IBOutlet weak var midBucketTextField: UITextField!
    @IBOutlet weak var lowBucketTextField: UITextField!
    @IBOutlet weak var endScoreLabel: UILabel!
    @IBOutlet weak var buttonSegControl: UISegmentedControl!
    @IBOutlet weak var climberSegControl: UISegmentedControl!
    @IBOutlet weak var autonRampSegControl1: UISegmentedControl!
    @IBOutlet weak var autonRampSegControl2: UISegmentedControl!
    @IBOutlet weak var highZipSwitch: UISwitch!
    @IBOutlet weak var midZipSwitch: UISwitch!
    @IBOutlet weak var lowZipSwitch: UISwitch!
    @IBOutlet weak var endgameRampSegControl1: UISegmentedControl!
    @IBOutlet weak var endgameRampSegControl2: UISegmentedControl!
    @IBOutlet weak var allClearSignal1: UISwitch!
    @IBOutlet weak var allClearSignal2: UISwitch!
    
    var backgroundTimer: NSTimer?
    
    var score: Int = 0
    var highDebrisScore: Int = 0
    var midDebrisScore: Int = 0
    var lowDebrisScore: Int = 0
    var autonButtonScore: Int = 0
    var autonRampScore1: Int = 0
    var autonRampScore2: Int = 0
    var ziplineTriggerScore: Int = 0
    var climbersScore: Int = 0
    var endgameRampScore2: Int = 0
    var endgameRampScore1: Int = 0
    var allClearScore: Int = 0
    
    let screenSize: CGRect = UIScreen.mainScreen().bounds
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundTimer = NSTimer.scheduledTimerWithTimeInterval(0.5, target: self, selector: "backgroundUpdate", userInfo: nil, repeats: true)
        scrollView.contentSize.height = 3000
        scrollView.contentSize.width = 20//screenSize.width
    }
    
    func backgroundUpdate(){
        scoreZiplineTriggers()
        debrisScoredHigh()
        debrisScoredMid()
        debrisScoredLow()
        autonRampOne()
        autonRampTwo()
        autonClimbers()
        autonButtons()
        endgameRampOne()
        endgameRampTwo()
        allClearSignal()
        
        updateScore()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func doneEditing(sender: AnyObject) {
        view.endEditing(true)
    }
    
    func updateScore(){
        score = highDebrisScore + midDebrisScore + lowDebrisScore + autonButtonScore + autonRampScore2 + autonRampScore1 + ziplineTriggerScore + climbersScore + endgameRampScore2 + endgameRampScore1 + allClearScore
        endScoreLabel.text = "\(score)"
    }
    
    func autonButtons(){
        switch (buttonSegControl.selectedSegmentIndex){
        case 1: autonButtonScore = 20
        case 2: autonButtonScore = 40
        default: autonButtonScore = 0
        }
    }
    
    func autonClimbers(){
        switch (climberSegControl.selectedSegmentIndex){
        case 1: climbersScore = 20
        case 2: climbersScore = 40
        case 3: climbersScore = 60
        case 4: climbersScore = 80
        default: climbersScore = 0
        }
    }
    
    func autonRampTwo(){
        switch (autonRampSegControl2.selectedSegmentIndex){
        case 1: autonRampScore2 = 5
        case 2: autonRampScore2 = 10
        case 3: autonRampScore2 = 20
        case 4: autonRampScore2 = 40
        default: autonRampScore2 = 0
        }
    }
    
    func endgameRampTwo(){
        switch (endgameRampSegControl2.selectedSegmentIndex){
        case 1: endgameRampScore2 = 5
        case 2: endgameRampScore2 = 10
        case 3: endgameRampScore2 = 20
        case 4: endgameRampScore2 = 40
        case 5: endgameRampScore2 = 80
        default: endgameRampScore2 = 0
        }
    }
    
    func autonRampOne(){
        switch (autonRampSegControl1.selectedSegmentIndex){
        case 1: autonRampScore1 = 5
        case 2: autonRampScore1 = 10
        case 3: autonRampScore1 = 20
        case 4: autonRampScore1 = 40
        default: autonRampScore1 = 0
        }
    }
    
    func endgameRampOne(){
        switch (endgameRampSegControl1.selectedSegmentIndex){
        case 1: endgameRampScore1 = 5
        case 2: endgameRampScore1 = 10
        case 3: endgameRampScore1 = 20
        case 4: endgameRampScore1 = 40
        case 5: endgameRampScore1 = 80
        default: endgameRampScore1 = 0
        }
    }
    
    func debrisScoredHigh(){
        //print(highBucketTextField.text)
        if(highBucketTextField.text != ""){
            highDebrisScore = 15*(Int(highBucketTextField.text!))!
        }
    }
    
    func debrisScoredMid(){
        //print(midBucketTextField.text)
        if(midBucketTextField.text != ""){
            midDebrisScore = 10*(Int(midBucketTextField.text!))!
        }
    }
    
    func debrisScoredLow(){
        //print(lowBucketTextField.text)
        if(lowBucketTextField.text != ""){
            lowDebrisScore = 5*(Int(lowBucketTextField.text!))!
        }
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
    
    func allClearSignal(){
        if(allClearSignal1.on && !allClearSignal2.on){
            allClearScore = 20
        }
        else if(allClearSignal2.on && !allClearSignal1.on){
            allClearScore = 20
        }
        else if(allClearSignal1.on && allClearSignal2.on){
            allClearScore = 40
        }
        else {
            allClearScore = 0
        }
    }
    
}

