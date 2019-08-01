//
//  UIButtonExtension.swift
//  SmartQ
//
//  Created by 何大海 on 2019/5/21.
//  Copyright © 2019 tiny. All rights reserved.
//

import Foundation
import UIKit

enum ButtonEdgeInsetsStyle {
    case Top
    case Left
    case Right
    case Bottom
}

extension UIButton {
    
    func layoutButton(style: ButtonEdgeInsetsStyle, imageTitleSpace: CGFloat) {
        //得到imageView和titleLabel的宽高
        let imageWidth = self.imageView?.frame.width
        let imageHeight = self.imageView?.frame.height
        
        var labelWidth: CGFloat! = 0.0
        var labelHeight: CGFloat! = 0.0
        
        labelWidth = self.titleLabel?.intrinsicContentSize.width
        labelHeight = self.titleLabel?.intrinsicContentSize.height
        
        self.contentHorizontalAlignment = UIControlContentHorizontalAlignment.center
        
        //初始化imageEdgeInsets和labelEdgeInsets
        var imageEdgeInsets = UIEdgeInsets.zero
        var labelEdgeInsets = UIEdgeInsets.zero
        
        //根据style和space得到imageEdgeInsets和labelEdgeInsets的值
        switch style {
        case .Top:
            imageEdgeInsets = UIEdgeInsetsMake(-labelHeight-imageTitleSpace/2, 0, 0, -labelWidth)
            labelEdgeInsets = UIEdgeInsetsMake(0, -imageWidth!, -imageHeight!-imageTitleSpace/2, 0)
            
//            var imageUpHeight:CGFloat!=self.bounds.midY-self.imageView!.bounds.midY-imageTitleSpace;
//            var imageLeftWidth:CGFloat!=self.bounds.midX-self.imageView!.frame.midX;
//            var titleUpHeight:CGFloat!=self.bounds.midY-self.titleLabel!.bounds.midY-imageTitleSpace;
//            var titleLeftWidth:CGFloat!=self.bounds.midX-self.titleLabel!.frame.midX;
//            imageEdgeInsets = UIEdgeInsetsMake(-imageUpHeight,imageLeftWidth,imageUpHeight,-imageLeftWidth);
//            titleEdgeInsets = UIEdgeInsetsMake(titleUpHeight,titleLeftWidth,-titleUpHeight,-titleLeftWidth);

            break;
            
        case .Left:
            imageEdgeInsets = UIEdgeInsetsMake(0, -imageTitleSpace/2, 0, imageTitleSpace)
            labelEdgeInsets = UIEdgeInsetsMake(0, imageTitleSpace/2, 0, -imageTitleSpace/2)
            break;
            
        case .Bottom:
            imageEdgeInsets = UIEdgeInsetsMake(0, 0, -labelHeight!-imageTitleSpace/2, -labelWidth)
            labelEdgeInsets = UIEdgeInsetsMake(-imageHeight!-imageTitleSpace/2, -imageWidth!, 0, 0)
            break;
            
        case .Right:
            imageEdgeInsets = UIEdgeInsetsMake(0, labelWidth+imageTitleSpace/2, 0, -labelWidth-imageTitleSpace/2)
            labelEdgeInsets = UIEdgeInsetsMake(0, -imageWidth!-imageTitleSpace/2, 0, imageWidth!+imageTitleSpace/2)
            break;
            
        }
        
        self.titleEdgeInsets = labelEdgeInsets
        self.imageEdgeInsets = imageEdgeInsets
        
    }
}

