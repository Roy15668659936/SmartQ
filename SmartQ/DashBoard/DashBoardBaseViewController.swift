//
//  DashBoardBaseViewController.swift
//  SmartQ
//
//  Created by Roy on 2019/7/24.
//  Copyright © 2019 tiny. All rights reserved.
//

import UIKit

class DashBoardBaseViewController: UIViewController {
    
    
    var menuVC:UIViewController!{
        didSet{
            view.layoutIfNeeded()
            menuView.addSubview(menuVC.view)
        }
    }
    
    var contentVC:UIViewController!{
        didSet{
            contentVC!.willMove(toParentViewController: contentVC)
            view.layoutIfNeeded()
            contentView.addSubview(contentVC.view)
        }
    }
    
    var originLeftMargin:CGFloat?
    
    var leftMargin: NSLayoutConstraint!
    
    var menuView: UIView!
    
    var contentView: UIView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        menuView = UIView()
        menuView.frame = CGRect(x:0, y:0, width:super.view.frame.width, height:super.view.frame.height)
        self.view.addSubview(menuView)
        
        contentView = UIView()
        contentView.frame = CGRect(x:0, y:0, width:super.view.frame.width, height:super.view.frame.height)
        self.view.addSubview(contentView)
        //影响拖拽
        //self.view.translatesAutoresizingMaskIntoConstraints = false
        //布局生效
        menuView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false

        let menuTrailing = NSLayoutConstraint(item: menuView, attribute: NSLayoutAttribute.trailing, relatedBy: NSLayoutRelation.equal, toItem: self.view, attribute:NSLayoutAttribute.trailing, multiplier: 1.0, constant: 0)
        self.view.addConstraint(menuTrailing)

        let menuTop = NSLayoutConstraint(item: menuView, attribute: NSLayoutAttribute.top, relatedBy: NSLayoutRelation.equal, toItem: self.view
            , attribute:NSLayoutAttribute.top, multiplier: 1.0, constant: 0)
        self.view.addConstraint(menuTop)

        let menuLeading = NSLayoutConstraint(item: menuView, attribute: NSLayoutAttribute.leading, relatedBy: NSLayoutRelation.equal, toItem: self.view
            , attribute:NSLayoutAttribute.leading, multiplier: 1.0, constant: 0)
        self.view.addConstraint(menuLeading)

        let menuBottom = NSLayoutConstraint(item:menuView, attribute: NSLayoutAttribute.bottom, relatedBy: NSLayoutRelation.equal, toItem: self.view, attribute:NSLayoutAttribute.bottom, multiplier: 1.0, constant: 0)
        self.view.addConstraint(menuBottom)

        let contentTop = NSLayoutConstraint(item: contentView, attribute: NSLayoutAttribute.top, relatedBy: NSLayoutRelation.equal, toItem: self.view
            , attribute:NSLayoutAttribute.top, multiplier: 1.0, constant: 0)
        self.view.addConstraint(contentTop)

        let contentTrailing = NSLayoutConstraint(item: self.view, attribute: NSLayoutAttribute.trailing, relatedBy: NSLayoutRelation.equal, toItem: contentView
            , attribute:NSLayoutAttribute.trailing, multiplier: 1.0, constant: 0)
        self.view.addConstraint(contentTrailing)

        leftMargin = NSLayoutConstraint(item: contentView, attribute: NSLayoutAttribute.leading, relatedBy: NSLayoutRelation.equal, toItem: self.view, attribute:NSLayoutAttribute.leading, multiplier: 1.0, constant: 0)
        self.view.addConstraint(leftMargin)

        let contentBottom = NSLayoutConstraint(item: self.view, attribute: NSLayoutAttribute.bottom, relatedBy: NSLayoutRelation.equal, toItem: contentView
            , attribute:NSLayoutAttribute.bottom, multiplier: 1.0, constant: 0)
        self.view.addConstraint(contentBottom)

        let uiPanGestureRecognizer = UIPanGestureRecognizer(target: self, action:#selector(DashBoardBaseViewController.onPanContentView(_:)))
//        self.view.isUserInteractionEnabled = true
        contentView.addGestureRecognizer(uiPanGestureRecognizer)
        
        
        UIView.animate(withDuration: 0.5, animations: { () -> Void in
            self.view.layoutIfNeeded()
        })
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        let buttonLeftMenu = UIButton(type:.custom)
        buttonLeftMenu.frame = CGRect(x:0, y:22, width:50, height:50)
        buttonLeftMenu.addTarget(self, action: #selector(buttonLeftMenuClick), for: .touchUpInside)
        contentVC.view.addSubview(buttonLeftMenu)

    }
    
    @objc func buttonLeftMenuClick(){

        if(leftMargin.constant == 0){
            leftMargin.constant =  UIScreen.main.bounds.width - 70
        }else{
            leftMargin.constant = 0
        }

    }
    @objc func onPanContentView(_ panGestureRecognizer: UIPanGestureRecognizer) {
        let transition = panGestureRecognizer.translation(in: self.view)
        let velocity = panGestureRecognizer.velocity(in: self.view)
        
        if panGestureRecognizer.state == UIGestureRecognizerState.began {
            originLeftMargin = leftMargin.constant
        } else if panGestureRecognizer.state == UIGestureRecognizerState.changed {
            leftMargin.constant = originLeftMargin! + transition.x
        } else if panGestureRecognizer.state == UIGestureRecognizerState.ended {
            if(velocity.x > 0){
                leftMargin.constant =  UIScreen.main.bounds.width - 70
            }else{
                leftMargin.constant = 0
            }
        }

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
