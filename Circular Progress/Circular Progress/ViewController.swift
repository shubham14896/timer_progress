//
//  ViewController.swift
//  Circular Progress
//
//  Created by Fluper on 19/03/19.
//  Copyright © 2019 Fluper. All rights reserved.
//

import UIKit
import UICircularProgressRing

class ViewController: UIViewController {
    
    var timer = Timer()

    @IBOutlet weak var timerRing: UICircularProgressRing!
    @IBOutlet weak var progressLabel: UILabel!
    
    var maximumValue: CGFloat = 8
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timerRing.maxValue = maximumValue
        scheduledTimerWithTimeInterval()
    }
    
    func scheduledTimerWithTimeInterval(){
        maximumValue = 8
        self.timerRing.startProgress(to: self.maximumValue, duration: 0.5)
        progressLabel.text = "\(Int(self.maximumValue))"
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateRing), userInfo: nil, repeats: true)
    }
    
    @objc func updateRing() {
        DispatchQueue.main.async {
            self.maximumValue = self.maximumValue - 1
            self.timerRing.startProgress(to: self.maximumValue, duration: 0.5)
            self.progressLabel.text = "\(Int(self.maximumValue))"
            if self.maximumValue == 0  {
                print("Time to stop")
                self.timerRing.startProgress(to: 0, duration: 0.5)
                self.timer.invalidate()
            }
        }
    }
    
    @IBAction func restart(_ sender: UIButton) {
        scheduledTimerWithTimeInterval()
    }

}

