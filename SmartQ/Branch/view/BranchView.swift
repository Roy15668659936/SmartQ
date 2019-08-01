//
//  BranchView.swift
//  SmartQ
//
//  Created by Roy on 2019/7/30.
//  Copyright © 2019 tiny. All rights reserved.
//

import Foundation
import UIKit

class BranchView: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource {
    
    let branchArry = [
        ["name": "开户", "picPath": "branch_restaurant"],
        ["name": "个人信息", "picPath": "branch_bank"],
        ["name": "转账", "picPath": "branch_housing_fund"],
        ["name": "联系方式", "picPath": "branch_hospital"],
        ["name": "风险评估", "picPath": "branch_state_grid"],
        ["name": "开通网银", "picPath": "branch_openbank"],
        ["name": "重置密码", "picPath": "branch_resetpwd"],
        ["name": "挂失", "picPath": "branch_lost"]
    ]
    
    var mainViewController:BaseViewController?
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        let layout = UICollectionViewFlowLayout.init()
        layout.itemSize = CGSize(width: SCREEN_WIDTH/4, height: SCREEN_WIDTH/4)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 0)
        layout.headerReferenceSize = CGSize(width: SCREEN_WIDTH, height: 35)
        super.init(frame: frame, collectionViewLayout: layout)
        self.delegate = self
        self.dataSource = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return branchArry.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellId", for: indexPath) as! BranchCell;
        
        if !branchArry.isEmpty {
            let model = BranchModel()
            model.setValuesForKeys(branchArry[indexPath.row])
            cell.createBranchListCellWith(Section: indexPath.section, Row: indexPath.row, CellModel: model)
            cell.contentView.backgroundColor = UIColor.white
            cell.mainViewController = self.mainViewController
        }
        
        print("i am in cell creation")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView {
        var reusableview:UICollectionReusableView!
        if(indexPath.section == 0 ){
            if kind == UICollectionElementKindSectionHeader{
                reusableview = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                               withReuseIdentifier: "BranchView", for: indexPath)
            }
            //分区尾
            else if kind == UICollectionElementKindSectionFooter{
                let label = UILabel()
                label.text = "Branch"
                reusableview = UICollectionReusableView()
                reusableview.addSubview(label)
            }
            return reusableview
        }
        return reusableview
    }
}
