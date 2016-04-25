//
//  AutonomousViewController.swift
//  FTC ResQ Calculator
//
//  Created by block7 on 3/31/16.
//  Copyright © 2016 Calvin Terpstra. All rights reserved.
//

import UIKit
import CoreData

class AutonomousViewController: UIViewController {
    
    @IBOutlet weak var endScoreLabel: UILabel!
    
//    @IBOutlet weak var buttonSegControl: UISegmentedControl!
//    @IBOutlet weak var climberSegControl: UISegmentedControl!
    @IBOutlet weak var autonRampSegControl1: UISegmentedControl!
    @IBOutlet weak var autonRampSegControl2: UISegmentedControl!
    
    @IBOutlet weak var target1Climber1: UISwitch!
    @IBOutlet weak var target1Climber2: UISwitch!
    @IBOutlet weak var target2Climber1: UISwitch!
    @IBOutlet weak var target2Climber2: UISwitch!
    @IBOutlet weak var target1Button: UISwitch!
    @IBOutlet weak var target2Button: UISwitch!
    
    var backgroundTimer: NSTimer?
    
    var autonScore: Int = 0

    var autonButtonScore1: Int = 0
    var autonButtonScore2: Int = 0
    var autonRampScore1: Int = 0
    var autonRampScore2: Int = 0
    var climbersScore1: Int = 0
    var climbersScore2: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundTimer = NSTimer.scheduledTimerWithTimeInterval(0.5, target: self, selector: "backgroundUpdate", userInfo: nil, repeats: true)
    }
    
    func backgroundUpdate(){
        autonRampOne()
        autonRampTwo()
        autonClimbersOne()
        autonClimbersTwo()
        autonButtonsOne()
        autonButtonsTwo()
        
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
        autonScore = autonButtonScore1 + autonButtonScore2 + autonRampScore2 + autonRampScore1 + climbersScore1 + climbersScore2
        endScoreLabel.text = "\(autonScore)"
        
        Match.match.temporaryAutonScore = autonScore
        Match.match.temporaryTarget1AutonScore = autonButtonScore1 + autonRampScore1 + climbersScore1
        Match.match.temporaryTarget2AutonScore = autonButtonScore2 + autonRampScore2 + climbersScore2
    }
    
    func autonClimbersOne(){
        if(target1Climber1.on && !target1Climber2.on){
            climbersScore1 = 20
        }
        else if(!target1Climber1.on && target1Climber2.on){
            climbersScore1 = 20
        }
        else if(target1Climber1.on && target1Climber2.on){
            climbersScore1 = 40
        }
        else {
            climbersScore1 = 0
        }
    }
    
    func autonClimbersTwo(){
        if(target2Climber1.on && !target2Climber2.on){
            climbersScore2 = 20
        }
        else if(!target2Climber1.on && target2Climber2.on){
            climbersScore2 = 20
        }
        else if(target2Climber1.on && target2Climber2.on){
            climbersScore2 = 40
        }
        else {
            climbersScore2 = 0
        }
    }
    
    func autonButtonsOne(){
        if(target1Button.on){
            autonButtonScore1 = 20
        }
        else {
            autonButtonScore1 = 0
        }
    }
    
    func autonButtonsTwo(){
        if(target2Button.on){
            autonButtonScore2 = 20
        }
        else {
            autonButtonScore2 = 0
        }
    }
    
//    func autonClimbers(){
//        if(target1Climber1.on && !target1Climber2.on && !target2Climber1.on && !target2Climber2.on){
//            autonButtonScore = 20
//            print("one")
//        }
//        else if(!target1Climber1.on && target1Climber2.on && !target2Climber1.on && !target2Climber2.on){
//            autonButtonScore = 20
//            print("one")
//        }
//        else if(!target1Climber1.on && !target1Climber2.on && target2Climber1.on && !target2Climber2.on){
//            autonButtonScore = 20
//            print("one")
//        }
//        else if(!target1Climber1.on && !target1Climber2.on && !target2Climber1.on && target2Climber2.on){
//            autonButtonScore = 20
//            print("one")
//        }
//        
//        else if(target1Climber1.on && target1Climber2.on && !target2Climber1.on && !target2Climber2.on){
//            autonButtonScore = 40
//        }
//        else if(target1Climber1.on && !target1Climber2.on && target2Climber1.on && !target2Climber2.on){
//            autonButtonScore = 40
//        }
//        else if(target1Climber1.on && !target1Climber2.on && !target2Climber1.on && target2Climber2.on){
//            autonButtonScore = 40
//        }
//        else if(!target1Climber1.on && target1Climber2.on && target2Climber1.on && !target2Climber2.on){
//            autonButtonScore = 40
//        }
//        else if(!target1Climber1.on && target1Climber2.on && !target2Climber1.on && target2Climber2.on){
//            autonButtonScore = 40
//        }
//        else if(!target1Climber1.on && !target1Climber2.on && target2Climber1.on && target2Climber2.on){
//            autonButtonScore = 40
//        }
//        
//        else if(target1Climber1.on && target1Climber2.on && target2Climber1.on && !target2Climber2.on){
//            autonButtonScore = 60
//        }
//        else if(!target1Climber1.on && target1Climber2.on && target2Climber1.on && target2Climber2.on){
//            autonButtonScore = 60
//        }
//        else if(target1Climber1.on && !target1Climber2.on && target2Climber1.on && target2Climber2.on){
//            autonButtonScore = 60
//        }
//        else if(target1Climber1.on && target1Climber2.on && !target2Climber1.on && target2Climber2.on){
//            autonButtonScore = 60
//        }
//        
//        else if(target1Climber1.on && target1Climber2.on && !target2Climber1.on && target2Climber2.on){
//            autonButtonScore = 80
//        }
//        else {
//            print("none")
//            autonButtonScore = 0
//        }
//    }
    
    func autonRampTwo(){
        switch (autonRampSegControl2.selectedSegmentIndex){
        case 1: autonRampScore2 = 5
        case 2: autonRampScore2 = 10
        case 3: autonRampScore2 = 20
        case 4: autonRampScore2 = 40
        default: autonRampScore2 = 0
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
}












