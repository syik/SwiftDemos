//
//  ViewController.swift
//  MaskAnimation
//
//  Created by Zj on 17/9/2.
//  Copyright © 2017年 Zj. All rights reserved.
//

import UIKit

class ViewController: UIViewController, CAAnimationDelegate {

    var maskBgView: UIView?
    var maskView: UIImageView?
    var contentView: UIImageView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        setSubViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        animation()
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    func setSubViews() {
        
        maskBgView = UIView(frame: view.bounds)
        maskBgView?.backgroundColor = UIColor(red: 0, green: 165.0/255.0, blue: 237.0/255.0, alpha: 1)
        
        view.addSubview(maskBgView!)
        
        contentView = UIImageView(frame: view.bounds)
        contentView?.image = #imageLiteral(resourceName: "screen")
     
        view.addSubview(contentView!)
        
        let screenWidth = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height
        
        let width = 67.5 * screenWidth / 350
        let height = 55.5 * screenHeight / 667
        
        maskView = UIImageView(frame: CGRect(x: screenWidth / 2 - width / 2, y: screenHeight / 2 - height / 2 - 30, width: width, height: height))
        maskView?.image = #imageLiteral(resourceName: "twitter")
        
        contentView?.layer.mask = maskView?.layer
    }
    
    func animation() {
    
        let animation = CAKeyframeAnimation(keyPath: "bounds")
        
        let initalBounds = NSValue(cgRect: maskView!.bounds)
        let secondBounds = NSValue(cgRect: CGRect(x:0, y:0, width:maskView!.bounds.width * 0.8, height:maskView!.bounds.height * 0.8))
        let finalBounds = NSValue(cgRect: CGRect(x:0, y:0, width:maskView!.bounds.width * 30, height:maskView!.bounds.height * 30))
        animation.values = [initalBounds, secondBounds, finalBounds]
        animation.duration = 1.5
        animation.isRemovedOnCompletion = true
        animation.delegate = self
        
        maskView?.layer.add(animation, forKey: nil)
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.5, execute: {
            self.maskView?.bounds = CGRect(x:0, y:0, width:self.maskView!.bounds.width * 30, height:self.maskView!.bounds.height * 30)
        })
    }
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        contentView?.layer.mask = nil
    }
}

