//
//  ContentTableViewController.swift
//  TransitionAnimation
//
//  Created by Zj on 17/9/3.
//  Copyright © 2017年 Zj. All rights reserved.
//

import UIKit

let contentCellReusedId = "contentCellReusedId"
let screenWidth = UIScreen.main.bounds.size.width

class ContentTableViewController: UITableViewController {
    
    var menuBtn: UIButton?
    var navigationBar: UIView?
    var titleLabel: UILabel?
    var statusArray: [ContentModel]?

    override func viewDidLoad() {
        super.viewDidLoad()

        setStatus()
        
        setCustomNaviBar()
        
        setTableView()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func setStatus() {
        
        let model1 = ContentModel(photo: #imageLiteral(resourceName: "1"), icon: #imageLiteral(resourceName: "a"), name: "Swift", info: "little bit mass")
        let model2 = ContentModel(photo: #imageLiteral(resourceName: "5"), icon: #imageLiteral(resourceName: "c"), name: "Objective-C", info: "little bit junk")
        let model3 = ContentModel(photo: #imageLiteral(resourceName: "3"), icon: #imageLiteral(resourceName: "b"), name: "Slow Back", info: "God works")
        let model4 = ContentModel(photo: #imageLiteral(resourceName: "2"), icon: #imageLiteral(resourceName: "f"), name: "Flatter Wash", info: "Go down to business")
        
        statusArray = [model1, model2, model3, model4]
    }
    
    func setCustomNaviBar() {
        
        self.title = "Every Moments"
        
        navigationBar = UIView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: 64))
        navigationBar?.backgroundColor = UIColor.black.withAlphaComponent(0.8)
        
        view.addSubview(navigationBar!)
        
        let menu = #imageLiteral(resourceName: "menu").withRenderingMode(.alwaysTemplate)
        
        menuBtn = UIButton(frame: CGRect(x: 5, y: 25, width: 34, height: 34))
        menuBtn?.setImage(menu, for: .normal)
        menuBtn?.addTarget(self, action: #selector(menuBtnClicked), for: .touchUpInside)
        menuBtn?.tintColor = UIColor.white
        
        navigationBar?.addSubview(menuBtn!)
        
        titleLabel = UILabel(frame: CGRect(x: 0, y: 20, width: screenWidth, height: 44))
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        titleLabel?.text = self.title
        titleLabel?.textAlignment = .center
        titleLabel?.textColor = UIColor.white
        
        navigationBar?.addSubview(titleLabel!)
    }
    
    func setTableView() {
        
        tableView.register(ContentTableViewCell.self, forCellReuseIdentifier: contentCellReusedId)
        tableView.backgroundColor = UIColor.black
        tableView.rowHeight = 300
        tableView.separatorStyle = .none
        tableView.contentInset = UIEdgeInsets(top: 44, left: 0, bottom: 0, right: 0)
    }

    func menuBtnClicked() {
    
        let menuVC = MenuTableViewController()
        self.present(menuVC, animated: true, completion: nil)
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (statusArray?.count)!
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: contentCellReusedId, for: indexPath) as? ContentTableViewCell
        cell?.contentModel = statusArray?[indexPath.row]
        
        return cell!
    }
    

    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        navigationBar?.frame = CGRect(x: 0, y: offsetY, width: screenWidth, height: 64)
    }
}
