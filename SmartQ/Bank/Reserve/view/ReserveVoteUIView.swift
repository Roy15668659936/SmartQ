//
//  ReserveVoteUIView.swift
//  OnlineReservation
//
//  Created by Roy on 2019/6/7.
//  Copyright © 2019 citi. All rights reserved.
//

import UIKit

class ReserveVoteUIView: UIView {

    open var voteDetails:UILabel!
    open var markLabel:UILabel!
    open var countMarkLabel:UILabel!
    open var countRateLabel:UILabel!
    open var imgIcon:UIImageView!
    open var fiveStarPV:UIProgressView!
    open var fourStarPV:UIProgressView!
    open var threeStarPV:UIProgressView!
    open var twoStarPV:UIProgressView!
    open var oneStarPV:UIProgressView!
    open var fiveStarImgIcon1:UIImageView!
    open var fiveStarImgIcon2:UIImageView!
    open var fiveStarImgIcon3:UIImageView!
    open var fiveStarImgIcon4:UIImageView!
    open var fiveStarImgIcon5:UIImageView!
    open var fourStarImgIcon1:UIImageView!
    open var fourStarImgIcon2:UIImageView!
    open var fourStarImgIcon3:UIImageView!
    open var fourStarImgIcon4:UIImageView!
    open var fourStarImgIcon5:UIImageView!
    open var threeStarImgIcon1:UIImageView!
    open var threeStarImgIcon2:UIImageView!
    open var threeStarImgIcon3:UIImageView!
    open var threeStarImgIcon4:UIImageView!
    open var threeStarImgIcon5:UIImageView!
    open var twoStarImgIcon1:UIImageView!
    open var twoStarImgIcon2:UIImageView!
    open var twoStarImgIcon3:UIImageView!
    open var twoStarImgIcon4:UIImageView!
    open var twoStarImgIcon5:UIImageView!
    open var oneStarImgIcon1:UIImageView!
    open var oneStarImgIcon2:UIImageView!
    open var oneStarImgIcon3:UIImageView!
    open var oneStarImgIcon4:UIImageView!
    open var oneStarImgIcon5:UIImageView!

    override func draw(_ rect: CGRect) {
        super.draw(rect)
//        imgIcon = UIImageView(frame: CGRect(x:view.frame.width -8, y:3, width: 50, height: 15))
//        imgIcon.image = UIImage(named:"mapicon")
        voteDetails = UILabel.init(frame: CGRect(x: self.frame.width - 60, y:0, width: 60, height: 15))
        voteDetails.text = "See All"
        voteDetails.textColor = UIColor.blue
        voteDetails.textAlignment = .right
        markLabel = UILabel.init(frame: CGRect(x: 0, y:20, width: self.frame.width / 2 - 80, height: 50))
        markLabel.text = "5.0"
        markLabel.font=UIFont(name:"Thonburi",size:50)
        markLabel.textAlignment = .center
        countMarkLabel = UILabel.init(frame: CGRect(x:0, y:80, width: self.frame.width / 2 - 80, height: 15))
        countMarkLabel.text = "out of 5"
        countMarkLabel.textAlignment = .center
        countMarkLabel.font=UIFont(name:"Thonburi",size:12)
        countRateLabel = UILabel.init(frame: CGRect(x: self.frame.width - 150, y:80, width: 150, height: 15))
        countRateLabel.text = "25 Ratings"
        countRateLabel.textAlignment = .right
        countRateLabel.font=UIFont(name:"Thonburi",size:12)
        fiveStarPV = UIProgressView(frame: CGRect(x: self.frame.width / 2, y:25, width: self.frame.width / 2, height: 10))
        fiveStarPV.progress = 0.8
        
        fourStarPV = UIProgressView(frame: CGRect(x: self.frame.width / 2, y:35, width: self.frame.width / 2, height: 10))
        fourStarPV.progress = 0.3
        
        threeStarPV = UIProgressView(frame: CGRect(x: self.frame.width / 2, y:45, width: self.frame.width / 2, height: 10))
        threeStarPV.progress = 0.1
        
        twoStarPV = UIProgressView(frame: CGRect(x: self.frame.width / 2, y:55, width: self.frame.width / 2, height: 10))
        twoStarPV.progress = 0.0
        
        oneStarPV = UIProgressView(frame: CGRect(x: self.frame.width / 2, y:65, width: self.frame.width / 2, height: 10))
        oneStarPV.progress = 0.0
        
//        fiveStarLabel = UILabel.init(frame: CGRect(x: self.frame.width / 2 - 70, y:20, width: 60, height: 10))
//        fiveStarLabel.text = "5"
        fiveStarImgIcon1 = UIImageView(frame: CGRect(x: self.frame.width / 2 - 60, y:20, width: 10, height: 10))
        fiveStarImgIcon1.image = UIImage(named:"blackstar")
        fiveStarImgIcon2 = UIImageView(frame: CGRect(x: self.frame.width / 2 - 50, y:20, width: 10, height: 10))
        fiveStarImgIcon2.image = UIImage(named:"blackstar")
        fiveStarImgIcon3 = UIImageView(frame: CGRect(x: self.frame.width / 2 - 40, y:20, width: 10, height: 10))
        fiveStarImgIcon3.image = UIImage(named:"blackstar")
        fiveStarImgIcon4 = UIImageView(frame: CGRect(x: self.frame.width / 2 - 30, y:20, width: 10, height: 10))
        fiveStarImgIcon4.image = UIImage(named:"blackstar")
        fiveStarImgIcon5 = UIImageView(frame: CGRect(x: self.frame.width / 2 - 20, y:20, width: 10, height: 10))
        fiveStarImgIcon5.image = UIImage(named:"blackstar")
        
        fourStarImgIcon1 = UIImageView(frame: CGRect(x: self.frame.width / 2 - 50, y:30, width: 10, height: 10))
        fourStarImgIcon1.image = UIImage(named:"blackstar")
        fourStarImgIcon2 = UIImageView(frame: CGRect(x: self.frame.width / 2 - 40, y:30, width: 10, height: 10))
        fourStarImgIcon2.image = UIImage(named:"blackstar")
        fourStarImgIcon3 = UIImageView(frame: CGRect(x: self.frame.width / 2 - 30, y:30, width: 10, height: 10))
        fourStarImgIcon3.image = UIImage(named:"blackstar")
        fourStarImgIcon4 = UIImageView(frame: CGRect(x: self.frame.width / 2 - 20, y:30, width: 10, height: 10))
        fourStarImgIcon4.image = UIImage(named:"blackstar")
        
        threeStarImgIcon1 = UIImageView(frame: CGRect(x: self.frame.width / 2 - 40, y:40, width: 10, height: 10))
        threeStarImgIcon1.image = UIImage(named:"blackstar")
        threeStarImgIcon2 = UIImageView(frame: CGRect(x: self.frame.width / 2 - 30, y:40, width: 10, height: 10))
        threeStarImgIcon2.image = UIImage(named:"blackstar")
        threeStarImgIcon3 = UIImageView(frame: CGRect(x: self.frame.width / 2 - 20, y:40, width: 10, height: 10))
        threeStarImgIcon3.image = UIImage(named:"blackstar")
        
        twoStarImgIcon1 = UIImageView(frame: CGRect(x: self.frame.width / 2 - 30, y:50, width: 10, height: 10))
        twoStarImgIcon1.image = UIImage(named:"blackstar")
        twoStarImgIcon2 = UIImageView(frame: CGRect(x: self.frame.width / 2 - 20, y:50, width: 10, height: 10))
        twoStarImgIcon2.image = UIImage(named:"blackstar")
        
        oneStarImgIcon1 = UIImageView(frame: CGRect(x: self.frame.width / 2 - 20, y:60, width: 10, height: 10))
        oneStarImgIcon1.image = UIImage(named:"blackstar")

        self.addSubview(voteDetails)
        self.addSubview(markLabel)
        self.addSubview(countMarkLabel)
        self.addSubview(countRateLabel)
        self.addSubview(fiveStarPV)
        self.addSubview(fourStarPV)
        self.addSubview(threeStarPV)
        self.addSubview(twoStarPV)
        self.addSubview(oneStarPV)
        self.addSubview(fiveStarImgIcon1)
        self.addSubview(fiveStarImgIcon2)
        self.addSubview(fiveStarImgIcon3)
        self.addSubview(fiveStarImgIcon4)
        self.addSubview(fiveStarImgIcon5)
        self.addSubview(fourStarImgIcon1)
        self.addSubview(fourStarImgIcon2)
        self.addSubview(fourStarImgIcon3)
        self.addSubview(fourStarImgIcon4)
        self.addSubview(threeStarImgIcon1)
        self.addSubview(threeStarImgIcon2)
        self.addSubview(threeStarImgIcon3)
        self.addSubview(twoStarImgIcon1)
        self.addSubview(twoStarImgIcon2)
        self.addSubview(oneStarImgIcon1)
    }
}
