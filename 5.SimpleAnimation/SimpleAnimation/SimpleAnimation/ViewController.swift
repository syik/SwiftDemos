//
//  ViewController.swift
//  SimpleAnimation
//
//  Created by Zj on 17/9/2.
//  Copyright © 2017年 Zj. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var titleLabel: UILabel?
    var backBtn: UIButton?
    var accountField: UITextField?
    var passwordField: UITextField?
    var loginBtn: UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(red: 0.2, green: 0.8, blue: 0.3, alpha: 1)
        
        setSubViews()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        animation()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func setSubViews() {
        
        let screenWidth = UIScreen.main.bounds.size.width
        //let screenHeight = UIScreen.main.bounds.size.height
        
        titleLabel = UILabel(frame: CGRect(x: 0, y: 20, width: screenWidth, height: 44))
        titleLabel?.text = "Welcome"
        titleLabel?.textColor = UIColor.white
        titleLabel?.font = UIFont.systemFont(ofSize: 20)
        titleLabel?.textAlignment = .center
        titleLabel?.isHidden = true
    
        view.addSubview(titleLabel!)
        
        backBtn = UIButton(frame: CGRect(x: 10, y: 20, width: 44, height: 44))
        backBtn?.setTitle("返回", for: .normal)
        backBtn?.addTarget(self, action: #selector(back), for: .touchUpInside)
        backBtn?.isHidden = true
        
        view.addSubview(backBtn!)
        
        accountField = UITextField(frame: CGRect(x: 30, y: 80, width: screenWidth - 60, height: 30))
        accountField?.layer.cornerRadius = 5
        accountField?.layer.masksToBounds = true
        accountField?.placeholder = "account"
        accountField?.backgroundColor = UIColor.white.withAlphaComponent(0.7)
        accountField?.layer.borderColor = UIColor.white.cgColor
        accountField?.layer.borderWidth = 1
        accountField?.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        accountField?.leftViewMode = .always
        accountField?.isHidden = true
        
        view.addSubview(accountField!)
        
        passwordField = UITextField(frame: CGRect(x: 30, y: 120, width: screenWidth - 60, height: 30))
        passwordField?.layer.cornerRadius = 5
        passwordField?.layer.masksToBounds = true
        passwordField?.placeholder = "password"
        passwordField?.isSecureTextEntry = true
        passwordField?.backgroundColor = UIColor.white.withAlphaComponent(0.7)
        passwordField?.layer.borderColor = UIColor.white.cgColor
        passwordField?.layer.borderWidth = 1
        passwordField?.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        passwordField?.leftViewMode = .always
        passwordField?.isHidden = true
        
        view.addSubview(passwordField!)
        
        loginBtn = UIButton(frame: CGRect(x: 60, y: 170, width: screenWidth - 120, height: 30))
        loginBtn?.setTitle("登录", for: .normal)
        loginBtn?.layer.cornerRadius = 5
        loginBtn?.layer.masksToBounds = true
        loginBtn?.backgroundColor = UIColor.white.withAlphaComponent(0.4)
        loginBtn?.layer.borderColor = UIColor.white.cgColor
        loginBtn?.layer.borderWidth = 1
        loginBtn?.isHidden = true
        
        view.addSubview(loginBtn!)
    }
    
    func animation() {
        
        let screenWidth = UIScreen.main.bounds.size.width
        
        accountField?.isHidden = false
        accountField?.transform = CGAffineTransform(translationX: -screenWidth, y: 0)
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.65, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            
            self.accountField?.transform = .identity
            
        }, completion: nil)
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.5, execute: {
            
            self.passwordField?.isHidden = false
            self.passwordField?.transform = CGAffineTransform(translationX: -screenWidth, y: 0)
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.65, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                
                self.passwordField?.transform = .identity
                
            }, completion: nil)
        })
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1.0, execute: {
            
            self.loginBtn?.isHidden = false
            self.loginBtn?.transform = CGAffineTransform(translationX: -screenWidth, y: 0)
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.65, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                
                self.loginBtn?.transform = .identity
                
            }, completion: { compete in
                
                self.titleLabel?.alpha = 0
                self.titleLabel?.isHidden = false
                self.backBtn?.alpha = 0
                self.backBtn?.isHidden = false
                UIView.animate(withDuration: 0.5, animations: {
                    self.titleLabel?.alpha = 1
                    self.backBtn?.alpha = 1
                })
                
            })
        })
    }
    
    func back() {
        print("返回!")
    }
}

