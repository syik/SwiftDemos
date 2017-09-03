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
        
        let fromView = transitionContext.view(forKey: UITransitionContextViewKey.from)!
        let toView = transitionContext.view(forKey: UITransitionContextViewKey.to)!
        
        let container = transitionContext.containerView
        let moveDown = CGAffineTransform(translationX: 0, y: 350)
        
        let snapshot = fromView.snapshotView(afterScreenUpdates: true)
        container.addSubview(toView)
        container.addSubview(snapshot!)
        toView.transform =
    }
    
    func dismiss(using transitionContext: UIViewControllerContextTransitioning) {
        
    }
}
