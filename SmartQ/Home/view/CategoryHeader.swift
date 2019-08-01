//
//  CategoryHeader.swift
//  SmartQ
//
//  Created by 何大海 on 2019/5/25.
//  Copyright © 2019 tiny. All rights reserved.
//

import Foundation
import UIKit

class CategoryHeader: UICollectionReusableView {

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.frame = CGRect(x:10, y:10, width:SCREEN_WIDTH - 10, height:16)
        let label = CommonUtil.createLabelWith(Text:"目前支持排队业务", Frame: self.frame, TextColor: UIColor.black, Font: CGFloat(15), TextAligtment: NSTextAlignment.left)
        self.addSubview(label)
        
        let bottomBorder = CommonUtil.createImageFrom(Color: UIColor.gray)
        let borderView = UIImageView()
        borderView.image = bottomBorder
        borderView.frame = CGRect(x:0, y:35, width:SCREEN_WIDTH, height:1)
        self.addSubview(borderView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
