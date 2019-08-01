//
//  DashBoardUINavigationController.swift
//  SmartQ
//
//  Created by Roy on 2019/7/26.
//  Copyright © 2019 tiny. All rights reserved.
//

import UIKit

class DashBoardUINavigationController: UINavigationController{

    override func viewDidLoad() {
        super.viewDidLoad()
        //header
        let signonHeaderView = UIImageView(image:UIImage(named:"signonHeader"))
        signonHeaderView.frame = CGRect(x:0, y:22, width:self.view.frame.width,height:44)
        self.view.addSubview(signonHeaderView)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
