//
//  ContentTableViewCell.swift
//  TransitionAnimation
//
//  Created by Zj on 17/9/3.
//  Copyright © 2017年 Zj. All rights reserved.
//

import UIKit
import SnapKit

class ContentTableViewCell: UITableViewCell {

    var photoView: UIImageView?
    var icon: UIImageView?
    var nameLabel: UILabel?
    var infoLabel: UILabel?
    var contentModel: ContentModel? {
        
        didSet {
            photoView?.image = contentModel?.photo
            icon?.image = contentModel?.icon
            nameLabel?.text = contentModel?.name
            infoLabel?.text = contentModel?.info
        }
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    
        selectionStyle = .none
        
        setSubViews()
        
        setAutoLayout()
    }
    
    func setSubViews() {
        
        photoView = UIImageView()
        addSubview(photoView!)
        
        icon = UIImageView()
        icon?.clipsToBounds = true
        icon?.layer.cornerRadius = 20
        addSubview(icon!)
        
        nameLabel = UILabel()
        nameLabel?.font = UIFont.systemFont(ofSize: 14)
        nameLabel?.textColor = UIColor.white
        addSubview(nameLabel!)
        
        infoLabel = UILabel()
        infoLabel?.font = UIFont.systemFont(ofSize: 14)
        infoLabel?.textColor = UIColor.white.withAlphaComponent(0.5)
        addSubview(infoLabel!)
    }
    
    func setAutoLayout() {
        
        photoView?.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.edges.equalTo(0)
        }
        
        icon?.snp.makeConstraints({ (ConstraintMaker) in
            ConstraintMaker.left.equalTo(10)
            ConstraintMaker.bottom.equalTo(-10)
            ConstraintMaker.width.height.equalTo(40)
        })
        
        nameLabel?.snp.makeConstraints({ (ConstraintMaker) in
            ConstraintMaker.left.equalTo((icon?.snp.right)!).offset(10)
            ConstraintMaker.height.equalTo(20)
            ConstraintMaker.width.equalTo(screenWidth)
            ConstraintMaker.top.equalTo(icon!)
        })
        
        infoLabel?.snp.makeConstraints({ (ConstraintMaker) in
            ConstraintMaker.left.equalTo((icon?.snp.right)!).offset(10)
            ConstraintMaker.height.equalTo(20)
            ConstraintMaker.width.equalTo(screenWidth)
            ConstraintMaker.bottom.equalTo(icon!)
        })
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
