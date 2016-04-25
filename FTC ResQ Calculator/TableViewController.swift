//
//  TableViewController.swift
//  FTC ResQ Calculator
//
//  Created by block7 on 3/14/16.
//  Copyright © 2016 Calvin Terpstra. All rights reserved.
//

import UIKit
import CoreData
//import Firebase

protocol TableViewControllerDelgate: class {
    func tableViewControllerDidGetInfo(name: Int)
}

class TableViewController: UIViewController, UITableViewDataSource, TableViewControllerDelgate  {
    
    @IBOutlet weak var tableView: UITableView!
    
    var matches = [NSManagedObject]()
    
   // var ref = Firebase(url:"https://resqscouter.firebaseio.com/")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "\"The List\""
        tableView.registerClass(UITableViewCell.self,
            forCellReuseIdentifier: "Cell")
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        
        if editingStyle == .Delete {
            
            let matchToDelete = matches[indexPath.row]
            
            let appDelegate =
            UIApplication.sharedApplication().delegate as! AppDelegate
            
            let managedContext = appDelegate.managedObjectContext
            
            managedContext.deleteObject(matchToDelete)
            
            matches.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            
            do {
                try managedContext.save()
            } catch let error as NSError {
                print("could not save: \(error)")
            }
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        //1
        let appDelegate =
        UIApplication.sharedApplication().delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext
        
        //2
        let fetchRequest = NSFetchRequest(entityName: "Match")
        
        //3
        do {
            let results =
            try managedContext.executeFetchRequest(fetchRequest)
            matches = results as! [NSManagedObject]
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func saveScore(score: Int) {
    }
    
    func tableView(tableView: UITableView,
        numberOfRowsInSection section: Int) -> Int {
            return matches.count
    }
    
    func tableView(tableView: UITableView,
        cellForRowAtIndexPath
        indexPath: NSIndexPath) -> UITableViewCell {
            
            let cell =
            tableView.dequeueReusableCellWithIdentifier("Cell")
            
            let match = matches[indexPath.row]
            
            cell!.textLabel!.text = "\((match.valueForKey("target1") as? NSNumber)!), \((match.valueForKey("target2") as? NSNumber)!) Total Score: \((match.valueForKey("totalScore") as? NSNumber)!)"
            //print("Score: \(match.valueForKey("totalScore") as? String)")
            
            return cell!
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "ShowDelegate"){
            let dvc = segue.destinationViewController as! ViewController
            dvc.delegate = self
        }
    }
    
    func tableViewControllerDidGetInfo(score: Int) {
        saveScore(score)
    }
    
//    @IBAction func refresh(sender: AnyObject) {
//        Match.match.sendData()
//    }
//    
//    func retrieveData(){
//        
//    }
    
    
    
    
    
    
    
    
    
}