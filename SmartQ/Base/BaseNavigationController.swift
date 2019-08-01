//
//  BaseNavigationController.swift
//  SmartQ
//
//  Created by 何大海 on 2019/5/6.
//  Copyright © 2019 tiny. All rights reserved.
//
import UIKit

class BaseNavigationController: UINavigationController {
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        
//        if self.viewControllers.count > 0 {
//            viewController.hidesBottomBarWhenPushed = true
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem().barButtonItemWith(Target: self, Action: #selector(pressBack), NormalImage: UIImage(named:"back")!, HighLightedImage: UIImage(named:"back")!)
//        }
        super.pushViewController(viewController, animated: animated)
        
    }
    
    @objc func pressBack(){
        if(self.viewControllers.count>1){
            self.popViewController(animated: true)
            self.title = "4"
        }else{
            self.dismiss(animated: true)
//            var rootVC = self.presentingViewController
//            while let parent = rootVC?.presentingViewController {
//                rootVC = parent
//            }
        }
    }
    
}
