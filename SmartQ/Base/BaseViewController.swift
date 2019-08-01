//
//  BaseViewController.swift
//  SmartQ
//
//  Created by 何大海 on 2019/5/6.
//  Copyright © 2019 tiny. All rights reserved.
//

import Foundation
import UIKit

class BaseViewController: UIViewController {
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = MAIN_WHITE_COLOR
        
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationController?.navigationBar.isTranslucent = true
        
        self.navigationController?.navigationBar.backgroundColor = UIColor(red: 232.0/255, green: 55.0/255, blue: 64.0/255, alpha: 1.0)
        
        //self.navigationController?.navigationBar.backgroundColor = UIColor.hexadecimalColor(hexadecimal: "#0073CC")
        self.navigationController?.navigationBar.barTintColor = UIColor.hexadecimalColor(hexadecimal: "#0073CC")
        //self.navigationController?.navigationBar.setBackgroundImage(UIImage(named:""), for: .default)
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor:UIColor.white]
        self.navigationController?.navigationBar.shadowImage = CommonUtil.createImageFrom(Color: UIColor.clear)
        
    }
    
    func setNavigation(Title title:String){
        self.navigationItem.title = title
    }
    
    
}
