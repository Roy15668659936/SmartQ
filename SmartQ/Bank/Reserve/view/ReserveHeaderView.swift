//
//  ReserveHeaderView.swift
//  OnlineReservation
//
//  Created by Roy on 2019/6/3.
//  Copyright © 2019 citi. All rights reserved.
//

import UIKit

class ReserveHeaderView: UIView {
    open var address:UILabel!
    open var phoneLabel:UILabel!
    open var phoneValue:UILabel!
    open var openLabel:UILabel!
    open var openValue:UILabel!
    open var imgIcon:UIImageView!
    
    open var branchItem:BranchLink?
    
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        imgIcon = UIImageView(frame: CGRect(x:4, y:4, width: 50, height: 50))
        imgIcon.image = UIImage(named:"mapicon")

        address = UILabel.init(frame: CGRect(x:50, y:20, width: 300, height: 15))
        address.text = branchItem?.branchName
        address.textColor = UIColor.white
        phoneLabel = UILabel.init(frame: CGRect(x:50, y:70, width: 80, height: 15))
        phoneLabel.text = "电话:"
        phoneLabel.textColor = UIColor.white
        phoneValue = UILabel.init(frame: CGRect(x:140, y:70, width: 200, height: 15))
        phoneValue.text = "(+86） 0411 36674211"
        phoneValue.textColor = UIColor.white
        openLabel = UILabel.init(frame: CGRect(x:50, y:120, width: 80, height: 25))
        openLabel.text = "营业时间:"
        openLabel.textColor = UIColor.white
        openValue = UILabel.init(frame: CGRect(x:140, y:120, width: 200, height: 45))
        openValue.lineBreakMode = NSLineBreakMode.byWordWrapping
        openValue.numberOfLines = 0
//        openValue.textAlignment = .justified

        openValue.text = "周一 到 周五 \n 8:00上午 - 5:00下午"
        openValue.textColor = UIColor.white
        self.addSubview(imgIcon)
        self.addSubview(address)
        self.addSubview(phoneLabel)
        self.addSubview(phoneValue)
        self.addSubview(openLabel)
        self.addSubview(openValue)
    }
}
    

