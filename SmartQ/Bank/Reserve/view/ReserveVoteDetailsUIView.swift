//
//  ReserveVoteDetailsUIView.swift
//  OnlineReservation
//
//  Created by Roy on 2019/6/7.
//  Copyright © 2019 citi. All rights reserved.
//

import UIKit

class ReserveVoteDetailsUIView: UIView {

    open var title:UILabel!
    open var date:UILabel!
    open var summary:UILabel!
    open var name:UILabel!
    open var moreLink:UILabel!
    open var starImgIcon1:UIImageView!
    open var starImgIcon2:UIImageView!
    open var starImgIcon3:UIImageView!
    open var starImgIcon4:UIImageView!
    open var starImgIcon5:UIImageView!
    override func draw(_ rect: CGRect) {
        self.layer.cornerRadius = 18;
        title = UILabel.init(frame: CGRect(x: 10, y:15, width: 100, height: 20))
        title.text = "Stunning."
        title.font=UIFont(name:"Thonburi",size:13)

        date = UILabel.init(frame: CGRect(x: self.frame.width - 210, y:15, width: 200, height: 15))
        date.text = "Wend"
        date.textAlignment = .right
        date.font=UIFont(name:"Thonburi",size:13)

        name = UILabel.init(frame: CGRect(x: self.frame.width - 210, y:40, width: 200, height: 15))
        name.text = "LaQuishaMane"
        name.textAlignment = .right
        name.font=UIFont(name:"Thonburi",size:13)
        
        self.addSubview(title)
        self.addSubview(date)
        self.addSubview(name)
        starImgIcon1 = UIImageView(frame: CGRect(x: 10, y:40, width: 20, height: 20))
        starImgIcon1.image = UIImage(named:"yellowstar")
        starImgIcon2 = UIImageView(frame: CGRect(x: 30, y:40, width: 20, height: 20))
        starImgIcon2.image = UIImage(named:"yellowstar")
        starImgIcon3 = UIImageView(frame: CGRect(x: 50, y:40, width: 20, height: 20))
        starImgIcon3.image = UIImage(named:"yellowstar")
        starImgIcon4 = UIImageView(frame: CGRect(x: 70, y:40, width: 20, height: 20))
        starImgIcon4.image = UIImage(named:"yellowstar")
        starImgIcon5 = UIImageView(frame: CGRect(x: 90, y:40, width: 20, height: 20))
        starImgIcon5.image = UIImage(named:"yellowstar")
        
        self.addSubview(starImgIcon1)
        self.addSubview(starImgIcon2)
        self.addSubview(starImgIcon3)
        self.addSubview(starImgIcon4)
        self.addSubview(starImgIcon5)
        
        
        summary = UILabel.init(frame: CGRect(x: 10, y:70, width: 200, height: 15))
        summary.text = "服务态度好，网上预约更方便。"
        summary.textAlignment = .left
        summary.font=UIFont(name:"Thonburi",size:13)
        self.addSubview(summary)
        
        
        moreLink = UILabel.init(frame: CGRect(x: self.frame.width - 60, y:90, width: 50, height: 15))
        moreLink.text = "more"
        moreLink.textColor = UIColor.blue
        moreLink.textAlignment = .right
        moreLink.font=UIFont(name:"Thonburi",size:13)

        self.addSubview(moreLink)

    }


}
