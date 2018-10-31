//
//  ViewController.swift
//  GCD
//
//  Created by zhangjun on 2018/10/31.
//  Copyright © 2018 zhangjun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let serialQueue = DispatchQueue(label: "serial_queue")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addLabel()
        
        testQueueLock()
    }
    
    func addLabel() -> Void {
        
        let label = UILabel()
        label.frame = UIScreen.main.bounds;
        label.font = UIFont.systemFont(ofSize: 50)
        label.textColor = UIColor.black
        label.textAlignment = .center
        label.backgroundColor = UIColor.lightGray.withAlphaComponent(0.3)
        
        self.view.addSubview(label)
        
        var i = 0;
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { (_) in
            i = i + 1
            label.text = String(NSString(format: "%i", i));
        }
    }
    
    func testQueueLock() -> Void {
        
        //将串行队列锁8秒
        let samaphore = DispatchSemaphore(value: 1);
        
        serialQueue.sync {
            NSLog("serial lock")
            samaphore.wait()
            DispatchQueue.main.asyncAfter(deadline: .now() + 8, execute: {
                samaphore.signal()
            })
        }
        
        //3秒后切换队列
        DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: {
            
            //Test GCD Lock
            self.serialQueue.async {
                NSLog("async serial queue")
            }
        })
    }
}

