//
//  Score.swift
//  FTC ResQ Calculator
//
//  Created by block7 on 4/4/16.
//  Copyright © 2016 Calvin Terpstra. All rights reserved.
//

import CoreData
import UIKit
//import Firebase

class Match {
    
    //var ref = Firebase(url:"https://resqscouter.firebaseio.com/")
    
    var matches = [NSManagedObject]()
    
    var temporaryAutonScore: Int
    var temporaryTeleopScore: Int
    var temporaryEndgameScore: Int
    var temporaryTarget1AutonScore: Int
    var temporaryTarget1TeleopScore: Int
    var temporaryTarget1EndgameScore: Int
    var temporaryTarget2AutonScore: Int
    var temporaryTarget2TeleopScore: Int
    var temporaryTarget2EndgameScore: Int
    
    var target1Robot: Int
    var target2Robot: Int
    var opponent1Robot: Int
    var opponent2Robot: Int
    
    var totalScore: Int
    var target1SubScore: Int
    var target2SubScore: Int
    var matchName: String
    var matchNumber: Int
    
    var scoreList: [String: Int]
    
    class var match : Match {
        struct Singleton {
            static let instance = Match()
        }
        return Singleton.instance
    }
    
    init(){
        temporaryAutonScore = 0
        temporaryTeleopScore = 0
        temporaryEndgameScore = 0
        temporaryTarget1AutonScore = 0
        temporaryTarget1TeleopScore = 0
        temporaryTarget1EndgameScore = 0
        temporaryTarget2AutonScore = 0
        temporaryTarget2TeleopScore = 0
        temporaryTarget2EndgameScore = 0
        target1Robot = 0
        target2Robot = 0
        opponent1Robot = 0
        opponent2Robot = 0
        
        totalScore = 0
        target1SubScore = 0
        target2SubScore = 0
        matchName = ""
        matchNumber = 0
        
        scoreList = ["testScore": 0]
    }
    
    func addScore(matchName: String, score: Int){
        scoreList[matchName] = score
    }
    
    func getScore(matchName: String) -> Int{
        return scoreList[matchName]!
    }
    
    func printScoreList(){
        print(scoreList)
    }
    
    func resetTempMatchData(){
        temporaryAutonScore = 0
        temporaryTeleopScore = 0
        temporaryEndgameScore = 0
        temporaryTarget1AutonScore = 0
        temporaryTarget1TeleopScore = 0
        temporaryTarget1EndgameScore = 0
        temporaryTarget2AutonScore = 0
        temporaryTarget2TeleopScore = 0
        temporaryTarget2EndgameScore = 0
        target1Robot = 0
        target2Robot = 0
        opponent1Robot = 0
        opponent2Robot = 0
        
        totalScore = 0
        target1SubScore = 0
        target2SubScore = 0
        matchName = ""
        matchNumber = 0
    }
    
    func saveData() {
        //print("saving data")
        
        totalScore = temporaryTarget1AutonScore + temporaryTarget1TeleopScore + temporaryTarget1EndgameScore + temporaryTarget2AutonScore + temporaryTarget2TeleopScore + temporaryTarget2EndgameScore
        target1SubScore = temporaryTarget1AutonScore + temporaryTarget1TeleopScore + temporaryTarget1EndgameScore
        target2SubScore = temporaryTarget2AutonScore + temporaryTarget2TeleopScore + temporaryTarget2EndgameScore
        matchName = "\(target1Robot), \(target2Robot), \(opponent1Robot), \(opponent2Robot)"
        //1
        let appDelegate =
        UIApplication.sharedApplication().delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext
        
        //2
        let entity =  NSEntityDescription.entityForName("Match",
            inManagedObjectContext:managedContext)
        
        let match = NSManagedObject(entity: entity!,
            insertIntoManagedObjectContext: managedContext)
        
        //3
        var coreData: NSNumber = (match.valueForKey("totalScore") as? NSNumber)!
        print("before saving: \(totalScore) set into \(coreData.integerValue)")
        
        match.setValue(NSNumber(integer: totalScore), forKey: "totalScore")
        match.setValue(target1SubScore, forKey: "target1SubScore")
        match.setValue(target2SubScore, forKey: "target2SubScore")
        match.setValue(target1Robot, forKey: "target1")
        match.setValue(target2Robot, forKey: "target2")
        match.setValue(opponent1Robot, forKey: "opponent1")
        match.setValue(opponent2Robot, forKey: "opponent2")
        match.setValue(matchNumber, forKey: "matchNumber")
        
        coreData = (match.valueForKey("totalScore") as? NSNumber)!
        print("after saving: \(totalScore) set into \(coreData.integerValue)")
        //4
        do {
            try managedContext.save()
            //var coreData2: String = (match.valueForKey("totalScore") as? String)!
            //print(coreData2)
            //5
            addScore(matchName,score: totalScore)
        } catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")
        }
        
        //delegate?.tableViewControllerDidGetInfo(totalScore)
    }
    
//    func sendData(){
//        //print("setting value")
//        //var match1 = ["match_number": "1", "teams": "6055, 1234, 4321, 7890"]
//        //var match2 = ["match_number": "2", "teams": "6055, 667, 665, 666"]
//        
//        var matchesRef = ref.childByAppendingPath("users")
//
//        var match = ["match_number": "\(matchNumber)", "teams": "\(matchName)"]
//        matches["match \(matchNumber)"] += [match]
//        
//        matchesRef.setValue(matches)
//    }
    
    
    
}





