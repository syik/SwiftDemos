//
//  ViewController.swift
//  PickerView
//
//  Created by Zj on 17/9/2.
//  Copyright © 2017年 Zj. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var startBtn: UIButton!
    
    var statusArray: [Array<String>]?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        setSubViews()
        
        setStatus()
    }
    
    @IBAction func startBtnClicked(_ sender: Any) {
        let component1 = arc4random_uniform(5)
        let component2 = arc4random_uniform(5)
        let component3 = arc4random_uniform(5)
        
        pickerView.selectRow(Int(component1), inComponent: 0, animated: true)
        pickerView.selectRow(Int(component2), inComponent: 1, animated: true)
        pickerView.selectRow(Int(component3), inComponent: 2, animated: true)
        
        if component1 == component2 && component2 == component3 {
            resultLabel.text = "Bingo!"
        } else {
            resultLabel.text = "Sorry~"
        }
    }
    
    func setSubViews() {
        
        startBtn.layer.cornerRadius = 10
        
        pickerView.dataSource = self
        pickerView.delegate = self
    }
    
    func setStatus() {
        
        let rowStatus = ["😈", "👹", "👻", "👽", "🤖"]
        statusArray = [rowStatus, rowStatus, rowStatus]
        pickerView.reloadAllComponents()
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return (statusArray?.count)!
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        let rowStatus = statusArray?[component]
        return (rowStatus?.count)!
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 100
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 80, height: 80))
        label.font = UIFont.systemFont(ofSize: 55)
        let rowStatus = statusArray?[component]
        label.text = rowStatus?[row]
        
        return label
    }
    
    
}

