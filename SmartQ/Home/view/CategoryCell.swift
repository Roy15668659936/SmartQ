//
//  CategoryCell.swift
//  SmartQ
//
//  Created by 何大海 on 2019/5/14.
//  Copyright © 2019 tiny. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class CategoryCell:UICollectionViewCell {
    
    let button = CatehoryButton(frame:CGRect(x:0, y:0, width: SCREEN_WIDTH/4, height: SCREEN_WIDTH/4))
    
    var mainViewController:BaseViewController?
    
    func createCategoryListCellWith(Section section:NSInteger, Row row:NSInteger, CellModel cellModel: CategoryModel){
        
        button.setTitleColor(UIColor.black, for: UIControl.State.normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        button.setTitle(cellModel.name, for: .normal)
        button.setImage(UIImage(named:cellModel.picPath), for: .normal)
        button.addTarget(self, action: #selector(buttonClick(button:)), for: .touchUpInside)
        button.tag = row
        button.contentHorizontalAlignment = UIControlContentHorizontalAlignment.center
        
        button.layoutButton(style: ButtonEdgeInsetsStyle.Top, imageTitleSpace: 5.0)
       
        self.contentView.addSubview(button)
        
    }
    
    @objc func buttonClick(button:UIButton){
        button.isSelected = !button.isSelected
        if button.currentTitle == "Flight" {
            //let viewController = FlightViewController()
            //mainViewContorller?.navigationController?.pushViewController(viewController, animated: true)
        } else if button.currentTitle == "银行" {
            //let viewController = ReserveViewController()
            let viewController =  BranchController()
            mainViewController?.navigationController?.pushViewController(viewController, animated: true)
        }
    }

    
}
