//
//  HomeController.swift
//  SmartQ
//
//  Created by 何大海 on 2019/5/7.
//  Copyright © 2019 tiny. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class HomeController: BaseViewController{
    
    lazy var  categoryMenu: CategoryView? = {
        let viewHeight = (SCREEN_WIDTH/4)*2 + 35// 20 is header
        let collectionView = CategoryView(frame: CGRect(x:0, y:290, width:SCREEN_WIDTH, height:viewHeight))
        collectionView.backgroundColor = UIColor.white
        collectionView.register(CategoryCell.self, forCellWithReuseIdentifier: "CellId")
        collectionView.register(CategoryHeader.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "HeaderView")
        return collectionView
    }()

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        super.setNavigation(Title: "SmartQ");
        //self.navigationItem..tintColor = UIColor.white
        
        let imagesStrings = [UIImage(named:"queue1"), UIImage(named:"queue2"), UIImage(named:"queue3")]
        let titles = ["窗口排队很烦", "银行排队排到老", "医院排队看病很麻烦"]
        let cycleScrollView = CycleScrollView.cycleScrollView(frame: CGRect.init(x: 0, y: 44, width: SCREEN_WIDTH, height: 280), imagesGroup: imagesStrings as NSArray)
        cycleScrollView.titlesGroup = titles as NSArray
        
//        cycleScrollView.callBackWithIndex = { (index : Int) in
//            print("当前图片 Index:\(index)")
//        }
        
        self.view.addSubview(cycleScrollView)
        categoryMenu?.mainViewController = self
        self.view.addSubview(categoryMenu!)
        
    }
    
    
    
}
