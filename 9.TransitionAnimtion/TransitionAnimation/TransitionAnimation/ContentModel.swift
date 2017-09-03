//
//  ContentModel.swift
//  TransitionAnimation
//
//  Created by Zj on 17/9/3.
//  Copyright © 2017年 Zj. All rights reserved.
//

import UIKit

class ContentModel: NSObject {
    
    var photo: UIImage?
    var icon: UIImage?
    var name: String?
    var info: String?
    
    required init(photo: UIImage, icon: UIImage, name: String, info: String) {
        super.init()
        
        self.photo = photo
        self.icon = icon
        self.name = name
        self.info = info
    }
}
