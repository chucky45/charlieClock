//
//  ViewController.swift
//  Timer
//
//  Created by Rebecca Berk on 11/7/18.
//  Copyright © 2018 Rebecca Berk. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var startstop: UISwitch!
    var timer: Timer?
    override func viewDidLoad() {
        super.viewDidLoad()
        createTimer()
    }
    func createTimer() {
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    func stopTimer() {
        if let unwrappedTimer = timer {
            unwrappedTimer.invalidate();
        }
    }
    func checkRunningTimer() -> Bool {
        if let unwrappedTimer = timer {
            return unwrappedTimer.isValid
        }
        return false
    }
    @objc func updateTimer() {
        if let textNum = time.text, let timerNum = Double(textNum) {
            let newTimerNum = timerNum + 0.01
            let rounded = round(newTimerNum * 100)/100
            time.text = String(rounded)
        }
    }
    @IBAction func restartTimer(_ sender: Any) {
        stopTimer()
        time.text = "0"
        startstop.setOn(false, animated: true)
    }
    @IBAction func startStopClicked(_ sender: Any) {
        //yell at them
        if startstop.isOn {
            createTimer()
        } else {
            stopTimer()
        }
    }
    
}

