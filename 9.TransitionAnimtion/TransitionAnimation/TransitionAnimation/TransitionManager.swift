//
//  TransitionManager.swift
//  TransitionAnimation
//
//  Created by Zj on 17/9/3.
//  Copyright © 2017年 Zj. All rights reserved.
//

import UIKit

enum animtionType: Int {
    case present = 0, dismiss
}

class TransitionManager: NSObject, UIViewControllerAnimatedTransitioning, UIViewControllerTransitioningDelegate {
    
    let duration = 1.0
    var type: animtionType?
    
    required init(type: animtionType) {
        super.init()
        self.type = type
    }
    
    //UIViewControllerAnimatedTransitioning
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        switch type! {
        case .present:
            present(using: transitionContext)
        default:
            dismiss(using: transitionContext)
            
        }
    }
    
    func present(using transitionContext: UIViewControllerContextTransitioning) {
        
        let fromView = transitionContext.view(forKey: .from)!
        let toView = transitionContext.view(forKey: .to)!
        
        let container = transitionContext.containerView
        let moveDown = CGAffineTransform(translationX: 0, y: 370)
        
        toView.transform = CGAffineTransform(translationX: 0, y: -50)
        let snapshot = fromView.snapshotView(afterScreenUpdates: true)
        container.addSubview(toView)
        container.addSubview(snapshot!)
        
        UIView.animate(withDuration: duration, animations: {
            
            snapshot!.transform = moveDown
            toView.transform = CGAffineTransform(translationX: 0, y: -20)
    
        }, completion: { finished in
        
            transitionContext.completeTransition(true)
        })
    }
    
    func dismiss(using transitionContext: UIViewControllerContextTransitioning) {
       
        let fromView = transitionContext.view(forKey: .from)!
        let toView = transitionContext.view(forKey: .to)!
        
        let container = transitionContext.containerView
        let moveDown = CGAffineTransform(translationX: 0, y: 370)
        
        toView.transform = moveDown
        let snapshot = fromView.snapshotView(afterScreenUpdates: true)
        container.addSubview(snapshot!)
        container.addSubview(toView)
        
        UIView.animate(withDuration: duration, animations: {
            
            snapshot!.transform = .identity
            toView.transform = .identity
            
        }, completion: { finished in
            
            transitionContext.completeTransition(true)
        })
    }
}
