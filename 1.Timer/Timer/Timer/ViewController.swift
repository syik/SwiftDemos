//
//  ViewController.swift
//  Timer
//
//  Created by 张骏 on 17/9/1.
//  Copyright © 2017年 ZJ. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var stopBtn: UIButton!
    @IBOutlet weak var startBtn: UIButton!
    @IBOutlet weak var clearBtn: UIButton!
    
    var timer: Timer?
    var isPause = true
    var time = 0.0 {
        didSet {
            timeLabel.text = String(format: "%.1f", time)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        setTimer()
    }
    
    func setTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: { (timer) in
            self.time += 0.1
        })
        stopTimer()
    }
    
    func startTimer() {
        isPause = false
        timer?.fireDate = Date()
    }
    
    func stopTimer() {
        isPause = true
        timer?.fireDate = Date.distantFuture
    }
    
    
    @IBAction func startBtnClicked(_ sender: Any) {
        if isPause {
            startTimer()
        }
    }
    
    @IBAction func stopBtnClicked(_ sender: Any) {
        if !isPause {
            stopTimer()
        }
    }
    
    @IBAction func clearBtnClicked(_ sender: Any) {
        stopTimer()
        time = 0.0
    }
}

