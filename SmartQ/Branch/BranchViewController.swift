//
//  BranchViewController.swift
//  SmartQ
//
//  Created by Roy on 2019/7/30.
//  Copyright © 2019 tiny. All rights reserved.


import Foundation
import UIKit
import SnapKit

class BranchViewController: BaseViewController{
    
    lazy var  branchMenu: BranchView? = {
        let viewHeight = (SCREEN_WIDTH/4)*2 + 35// 20 is header
        let collectionView = BranchView(frame: CGRect(x:0, y:310, width:SCREEN_WIDTH, height:viewHeight))
        collectionView.backgroundColor = UIColor.white
        collectionView.layer.borderColor = UIColor.white.cgColor
        collectionView.register(BranchCell.self, forCellWithReuseIdentifier: "CellId")
        collectionView.register(BranchHeader.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "BranchView")
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        super.setNavigation(Title: "网店预约");
        let imagesStrings = [UIImage(named:"advertisement1"), UIImage(named:"advertisement2")]
        let titles = ["预约排号", "抽奖惊喜"]
        let cycleScrollView = CycleScrollView.cycleScrollView(frame: CGRect.init(x: 0, y: 44, width: SCREEN_WIDTH, height: 140), imagesGroup: imagesStrings as NSArray)
        cycleScrollView.titlesGroup = titles as NSArray
        self.view.addSubview(cycleScrollView)
        
        let bankNameFrame = CGRect(x:0, y:190, width:SCREEN_WIDTH, height:25)
        let distanceFrame = CGRect(x:0, y:215, width:SCREEN_WIDTH, height:25)
        let addressFrame = CGRect(x:0, y:240, width:SCREEN_WIDTH, height:25)
        
        let bankName = CommonUtil.createLabelWith(Text:"花旗银行 （大连分行）", Frame: bankNameFrame, TextColor: UIColor.black, Font: CGFloat(15), TextAligtment: NSTextAlignment.center)
        let distance = CommonUtil.createLabelWith(Text:"最近 18.8 公里", Frame: distanceFrame, TextColor: UIColor.black, Font: CGFloat(10), TextAligtment: NSTextAlignment.center)
        let address = CommonUtil.createLabelWith(Text:"大连市中山区港兴路6号", Frame: addressFrame, TextColor: UIColor.black, Font: CGFloat(12), TextAligtment: NSTextAlignment.center)
        
        self.view.addSubview(bankName)
        self.view.addSubview(distance)
        self.view.addSubview(address)
        
        
        let buttonConfirm = UIButton(type:.custom)
        buttonConfirm.frame = CGRect(x:SCREEN_WIDTH/2 - 40, y:270, width:80, height:30)
        buttonConfirm.setTitle("取号", for: .normal)
        buttonConfirm.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        buttonConfirm.setTitleColor(UIColor.white, for: .normal)
        buttonConfirm.addTarget(self, action: #selector(buttonConfirmClick), for: .touchUpInside)
        buttonConfirm.layer.borderColor = UIColor.gray.cgColor
        buttonConfirm.backgroundColor = UIColor.init(red: 239/250, green: 239/250, blue: 244/250, alpha: 1.0)
        buttonConfirm.layer.borderWidth = 0;
        buttonConfirm.layer.cornerRadius = 8;
        buttonConfirm.backgroundColor = UIColor.blue
        self.view.addSubview(buttonConfirm)
        
        let buttonSelect = UIButton(type:.custom)
        buttonSelect.frame = CGRect(x:SCREEN_WIDTH/4 * 3 - 40, y:270, width:80, height:30)
        buttonSelect.setTitle("更多网点", for: .normal)
        buttonSelect.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        buttonSelect.setTitleColor(UIColor.blue, for: .normal)
        buttonSelect.addTarget(self, action: #selector(buttonSelectClick), for: .touchUpInside)
        buttonSelect.layer.borderColor = UIColor.gray.cgColor
        buttonSelect.backgroundColor = UIColor.init(red: 239/250, green: 239/250, blue: 244/250, alpha: 1.0)
        buttonSelect.layer.borderWidth = 0;
        buttonSelect.layer.cornerRadius = 16;
        buttonSelect.backgroundColor = UIColor.white
        self.view.addSubview(buttonSelect)
        
        self.view.backgroundColor = UIColor.white
        branchMenu?.mainViewController = self
        self.view.addSubview(branchMenu!)
        
    }
    
    @objc func buttonConfirmClick(){
        let viewController = ReserveViewController()
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    @objc func buttonSelectClick(){
        let viewController =  BranchController()
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}
