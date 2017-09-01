//
//  ViewController.swift
//  CollectionView
//
//  Created by 张骏 on 17/9/1.
//  Copyright © 2017年 ZJ. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    var collectionView: UICollectionView?
    var statusArray = [UIImage(named: "1"), UIImage(named: "2"), UIImage(named: "3"), UIImage(named: "4")]

    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        setCollectionView()
    }
    
    func setCollectionView() {
    
        let screenWidth = UIScreen.main.bounds.size.width
        let screenHeight = UIScreen.main.bounds.size.height
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: screenWidth * 0.7, height: screenHeight * 0.7)
        layout.minimumLineSpacing = 30
        layout.minimumInteritemSpacing = 30
        layout.scrollDirection = .horizontal
        
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
        collectionView?.register(CollectionViewCell.self, forCellWithReuseIdentifier: "reusedId")
        collectionView?.dataSource = self
        collectionView?.delegate = self
        
        view.addSubview(collectionView!)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return statusArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "reusedId", for: indexPath) as! CollectionViewCell
        cell.imageView?.image = statusArray[indexPath.item]
        
        return cell
    }
}

