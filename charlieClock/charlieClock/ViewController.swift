//
//  ViewController.swift
//  charlieClock
//
//  Created by Kevin Berk on 11/29/18.
//  Copyright © 2018 Kevin Berk. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var stopWatchLabel: UILabel!
    @IBOutlet weak var startStopButton: UISwitch!
    var timer: Timer?
    let TimerIncrement = 0.01
    override func viewDidLoad() {
        super.viewDidLoad()
        timer = Timer.scheduledTimer(timeInterval: TimerIncrement, target: self, selector: #selector(self.timerFire(_:)), userInfo: nil, repeats: true)
    }
    @objc func timerFire (_ timer: Timer){
        
    }
    @IBAction func startStopClicked(_ sender: Any) {
    }
    
}

