//
//  ViewController.swift
//  charlieAnimation
//
//  Created by Kevin Berk on 1/13/19.
//  Copyright © 2019 Kevin Berk. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var BlockofSky: UIView!
    var guestureRecognition = UIPanGestureRecognizer()
    override func viewDidLoad() {
        super.viewDidLoad()
        UIView.animate(withDuration: 2, animations: {
            self.BlockofSky.center.y += 100
            self.BlockofSky.center.x += 100
        })
        guestureRecognition = UIPanGestureRecognizer(target: self, action: #selector(ViewController.viewWasDragged(_:)))
        BlockofSky.isUserInteractionEnabled = true
        BlockofSky.addGestureRecognizer(guestureRecognition)
    }
    
    @objc func viewWasDragged(_ Sender: UIPanGestureRecognizer) {
        let translator = Sender.translation(in: self.view)
        BlockofSky.center = CGPoint(x: BlockofSky.center.x + translator.x, y: BlockofSky.center.y + translator.y)
        Sender.setTranslation(CGPoint.zero, in: self.view)
    }
    func getRandomColor() -> UIColor {
        //Generate between 0 to 1
        let red:CGFloat = CGFloat(drand48())
        let green:CGFloat = CGFloat(drand48())
        let blue:CGFloat = CGFloat(drand48())
        
        return UIColor(red:red, green: green, blue: blue, alpha: 1.0)
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch: AnyObject in touches {
            if touch.view == BlockofSky {
                BlockofSky.backgroundColor = getRandomColor()
            }
        }
    }
}


