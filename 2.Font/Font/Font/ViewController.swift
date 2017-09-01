//
//  ViewController.swift
//  Font
//
//  Created by 张骏 on 17/9/1.
//  Copyright © 2017年 ZJ. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var changeBtn: UIButton!
    
    var changed = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setSubViews()
    }

    func setSubViews() {
        changeBtn.layer.cornerRadius = changeBtn.bounds.size.width / 2
    }

    @IBAction func changeBtnClicked(_ sender: Any) {
        
        if changed {
            
            textView.font = UIFont.systemFont(ofSize: 20)
            changed = false
        } else {
            
            textView.font = UIFont(name: "MFZhiHei_Noncommercial-Regular", size: 20)
            changed = true
        }
    }
}

