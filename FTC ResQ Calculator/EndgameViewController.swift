//
//  EndgameViewController.swift
//  FTC ResQ Calculator
//
//  Created by block7 on 4/6/16.
//  Copyright © 2016 Calvin Terpstra. All rights reserved.
//

import UIKit

class EndgameViewController: UIViewController {
    
    @IBOutlet weak var endScoreLabel: UILabel!

    @IBOutlet weak var endgameRampSegControl1: UISegmentedControl!
    @IBOutlet weak var endgameRampSegControl2: UISegmentedControl!
    @IBOutlet weak var allClearSignal1: UISwitch!
    @IBOutlet weak var allClearSignal2: UISwitch!
    
    var backgroundTimer: NSTimer?
    
    var endgameScore: Int = 0

    var endgameRampScore2: Int = 0
    var endgameRampScore1: Int = 0
    var allClear1Score: Int = 0
    var allClear2Score: Int = 0
    
    let screenSize: CGRect = UIScreen.mainScreen().bounds
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundTimer = NSTimer.scheduledTimerWithTimeInterval(0.5, target: self, selector: "backgroundUpdate", userInfo: nil, repeats: true)
    }
    
    func backgroundUpdate(){
        endgameRampOne()
        endgameRampTwo()
        allClearTwo()
        allClearOne()
        
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
        endgameScore = endgameRampScore2 + endgameRampScore1 + allClear1Score + allClear2Score
        endScoreLabel.text = "\(endgameScore)"
        
        Match.match.temporaryTarget1EndgameScore = endgameRampScore1 + allClear1Score
        Match.match.temporaryTarget2EndgameScore = endgameRampScore2 + allClear2Score
        Match.match.temporaryEndgameScore = endgameScore
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
    
    func allClearTwo(){
        if(allClearSignal2.on){
            allClear2Score = 20
        }
        else {
            allClear2Score = 0
        }
    }
    
    func allClearOne(){
        if(allClearSignal1.on){
            allClear1Score = 20
        }
        else {
            allClear1Score = 0
        }
    }

    
//    func allClearSignal(){
//        if(allClearSignal1.on && !allClearSignal2.on){
//            allClearScore = 20
//        }
//        else if(allClearSignal2.on && !allClearSignal1.on){
//            allClearScore = 20
//        }
//        else if(allClearSignal1.on && allClearSignal2.on){
//            allClearScore = 40
//        }
//        else {
//            allClearScore = 0
//        }
//    }
    
}