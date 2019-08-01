//
//  CategoryView.swift
//  SmartQ
//
//  Created by 何大海 on 2019/5/14.
//  Copyright © 2019 tiny. All rights reserved.
//

import Foundation
import UIKit

class CategoryView: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource {
    
    let categoryArry = [
        ["name": "饭店", "picPath": "category_restaurant"],
        ["name": "银行", "picPath": "category_bank"],
        ["name": "公积金中心", "picPath": "category_housing_fund"],
        ["name": "医院", "picPath": "category_hospital"],
        ["name": "国家电网", "picPath": "category_state_grid"]
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
        return categoryArry.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellId", for: indexPath) as! CategoryCell;
       
        if !categoryArry.isEmpty {
            let model = CategoryModel()
            model.setValuesForKeys(categoryArry[indexPath.row])
            cell.createCategoryListCellWith(Section: indexPath.section, Row: indexPath.row, CellModel: model)
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
                            withReuseIdentifier: "HeaderView", for: indexPath)
            }
                //分区尾
            else if kind == UICollectionElementKindSectionFooter{
                let label = UILabel()
                label.text = "Category"
                reusableview = UICollectionReusableView()
                reusableview.addSubview(label)
            }
            return reusableview
        }

        return reusableview
        
    }
    
    
    
    
}
