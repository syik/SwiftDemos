//
//  ViewController.swift
//  TableView
//
//  Created by 张骏 on 17/9/1.
//  Copyright © 2017年 ZJ. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var tableView: UITableView?
    var statusArray = ["这里有关于主播的一切数据", "弹幕波动", "活跃时间", "高频词汇", "在线人数波动", "关注波动", "粉丝等级分布", "粉丝发言次数排行", "礼物价值分布", "主播体重增长", "还能看到土豪们的历史发言!"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        setTableView()
    }
    
    func setTableView() {
        tableView = UITableView(frame: view.bounds, style: .plain)
        tableView?.delegate = self
        tableView?.dataSource = self
        tableView?.separatorColor = UIColor.white.withAlphaComponent(0.5)
        tableView?.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        tableView?.rowHeight = 88
        tableView?.register(UITableViewCell.self, forCellReuseIdentifier: "reusedId")
        
        view.addSubview(tableView!)
    }
    
    func getColor(row: Int) -> UIColor {
     
        let green = CGFloat(row)/CGFloat(statusArray.count) * 0.6
        
        return UIColor(red: 1.0, green: green, blue: 0.0, alpha: 1.0)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return statusArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reusedId", for: indexPath)
        cell.textLabel?.text = statusArray[indexPath.row]
        cell.textLabel?.textColor = UIColor.white
        
        let color = getColor(row: indexPath.row)
        cell.backgroundColor = color
        
        let gradient = CAGradientLayer()
        gradient.frame = cell.bounds
        gradient.colors = [color.withAlphaComponent(0.2).cgColor, UIColor.clear.cgColor]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 0, y: 1)
        
        for layer in cell.layer.sublayers! {
            if layer.isKind(of: CAGradientLayer.self) {
                layer.removeFromSuperlayer()
            }
        }
        
        cell.layer.addSublayer(gradient)
        
        return cell
    }
}

