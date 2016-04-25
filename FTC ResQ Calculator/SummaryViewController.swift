//
//  SummaryViewController.swift
//  FTC ResQ Calculator
//
//  Created by block7 on 4/8/16.
//  Copyright © 2016 Calvin Terpstra. All rights reserved.
//

import UIKit
import CoreData

class SummaryViewController: UIViewController {
    
    @IBOutlet weak var target1SubScore: UILabel!
    @IBOutlet weak var target2SubScore: UILabel!
    @IBOutlet weak var totalScore: UILabel!
    
    var backgroundTimer: NSTimer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundTimer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: "backgroundUpdate", userInfo: nil, repeats: true)
    }
    
    func backgroundUpdate(){
        target1SubScore.text = "\(Match.match.temporaryTarget1AutonScore + Match.match.temporaryTarget1TeleopScore + Match.match.temporaryTarget1EndgameScore)"
        target2SubScore.text = "\(Match.match.temporaryTarget2AutonScore + Match.match.temporaryTarget2TeleopScore + Match.match.temporaryTarget2EndgameScore)"
        totalScore.text = "\(Match.match.temporaryAutonScore + Match.match.temporaryTarget1TeleopScore + Match.match.temporaryTarget2TeleopScore + Match.match.temporaryEndgameScore)"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func save(sender: AnyObject) {
        Match.match.saveData()
        //print("saving...")
        //dismissViewControllerAnimated(true, completion: nil)
    }
    
//    func saveData() {
//        let totalScore: Int = Match.match.temporaryAutonScore + Match.match.temporaryTeleopScore + Match.match.temporaryEndgameScore
//        let target1SubScore: Int = Match.match.temporaryTarget1AutonScore + Match.match.temporaryTarget1TeleopScore + Match.match.temporaryTarget1EndgameScore
//        let target2SubScore: Int = Match.match.temporaryTarget2AutonScore + Match.match.temporaryTarget2TeleopScore + Match.match.temporaryTarget2EndgameScore
//        let matchName: String = "\(Match.match.target1Robot), \(Match.match.target2Robot), \(Match.match.opponent1Robot), \(Match.match.opponent2Robot)"
//        //1
//        let appDelegate =
//        UIApplication.sharedApplication().delegate as! AppDelegate
//        
//        let managedContext = appDelegate.managedObjectContext
//        
//        //2
//        let entity =  NSEntityDescription.entityForName("Match",
//            inManagedObjectContext:managedContext)
//        
//        let match = NSManagedObject(entity: entity!,
//            insertIntoManagedObjectContext: managedContext)
//        
//        //3
//        match.setValue(totalScore, forKey: "totalScore")
//        match.setValue(target1SubScore, forKey: "target1SubScore")
//        match.setValue(target2SubScore, forKey: "target2SubScore")
//        match.setValue(Match.match.target1Robot, forKey: "target1")
//        match.setValue(Match.match.target2Robot, forKey: "target2")
//        match.setValue(Match.match.opponent1Robot, forKey: "opponent1")
//        match.setValue(Match.match.opponent2Robot, forKey: "opponent2")
//        //4
//        do {
//            try managedContext.save()
//            //5
//            Match.match.addScore(matchName,score: totalScore)
//        } catch let error as NSError  {
//            print("Could not save \(error), \(error.userInfo)")
//        }
//        
//        delegate?.tableViewControllerDidGetInfo(score: totalScore)
//    }
    
}