//
//  FirstViewController.swift
//  FTC ResQ Calculator
//
//  Created by block7 on 4/7/16.
//  Copyright © 2016 Calvin Terpstra. All rights reserved.
//

import UIKit

class SetupViewController: UIViewController {

    var backgroundTimer: NSTimer?
    
    @IBOutlet weak var target1: UITextField!
    @IBOutlet weak var target2: UITextField!
    @IBOutlet weak var opponent1: UITextField!
    @IBOutlet weak var opponent2: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundTimer = NSTimer.scheduledTimerWithTimeInterval(0.5, target: self, selector: "backgroundUpdate", userInfo: nil, repeats: true)
    }
    
    func backgroundUpdate(){
        if(target1.text! != ""){
            Match.match.target1Robot = (Int)(target1.text!)!
        }
        if(target2.text! != ""){
            Match.match.target2Robot = (Int)(target2.text!)!
        }
        if(opponent1.text! != ""){
            Match.match.opponent1Robot = (Int)(opponent1.text!)!
        }
        if(opponent2.text! != ""){
            Match.match.opponent2Robot = (Int)(opponent2.text!)!
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}