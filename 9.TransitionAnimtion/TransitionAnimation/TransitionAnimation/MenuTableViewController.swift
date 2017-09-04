//
//  MenuTableViewController.swift
//  TransitionAnimation
//
//  Created by Zj on 17/9/3.
//  Copyright © 2017年 Zj. All rights reserved.
//

import UIKit

let cellReusedId = "cellReusedId"

class MenuTableViewController: UITableViewController {

    let statusArray = ["Every Moments", "Popular", "Editors", "Upcoming", "Fresh", "Stock-photos", "Trending"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColor.clear
        tableView.rowHeight = 50
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReusedId)
        tableView.contentInset = UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let cell = tableView.visibleCells.first
        cell?.superview?.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(menuDismiss)))
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func menuDismiss() {
        self.dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return statusArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReusedId, for: indexPath)
        cell.textLabel?.text = statusArray[indexPath.row]
        cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        cell.textLabel?.textColor = UIColor.white
        cell.selectionStyle = .none
        cell.backgroundColor = UIColor.black
        
        return cell
    }
}
