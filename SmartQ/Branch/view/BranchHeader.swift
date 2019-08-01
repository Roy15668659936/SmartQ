//
//  BranchView.swift
//  SmartQ
//
//  Created by Roy on 2019/7/30.
//  Copyright © 2019 tiny. All rights reserved.
//

import Foundation
import UIKit

class BranchHeader: UICollectionReusableView {
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.frame = CGRect(x:0, y:0, width:SCREEN_WIDTH, height:50)


        let bottomBorder = CommonUtil.createImageFrom(Color: UIColor.gray)
        let borderView = UIImageView()
        borderView.image = bottomBorder
        borderView.frame = CGRect(x:0, y:0, width:SCREEN_WIDTH, height:1)
        self.addSubview(borderView)
        
        
        let bankNameFrame = CGRect(x:10, y:5, width:SCREEN_WIDTH, height:15)
        let distanceFrame = CGRect(x:10, y:20, width:SCREEN_WIDTH, height:15)
        
        let title1 = CommonUtil.createLabelWith(Text:"以下业务可以虚拟柜员机办理，无需预约。", Frame: bankNameFrame, TextColor: UIColor.black, Font: CGFloat(12), TextAligtment: NSTextAlignment.left)
        let title2 = CommonUtil.createLabelWith(Text:"在手机上填单可节省您的时间", Frame: distanceFrame, TextColor: UIColor.black, Font: CGFloat(12), TextAligtment: NSTextAlignment.left)

        self.addSubview(title1)
        self.addSubview(title2)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
