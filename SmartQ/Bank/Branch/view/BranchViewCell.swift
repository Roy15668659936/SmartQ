//
//  BranchViewCell.swift
//  SmartQ
//
//  Created by vewang on 2019/6/15.
//  Copyright © 2019 tiny. All rights reserved.
//

import UIKit

class BranchViewCell: UITableViewCell {
    var branchNameLbl: UILabel!
    var branchImageView: UIImageView!
    var branchDistanceLbl: UILabel!
    var branchAddressLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        self.layoutUI()
    }
    override init(style: BranchViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        // self.selectionStyle = UITableViewCell.SelectionStyle.none
        self.layoutUI()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func layoutUI() {
        branchNameLbl = UILabel(frame: CGRect(x:15, y:30, width: 200, height: 15))
        branchImageView = UIImageView(frame: CGRect(x:260, y:30, width: 15, height: 15))
        branchDistanceLbl = UILabel(frame: CGRect(x:320, y:30, width: 150, height: 15))
        branchAddressLbl = UILabel(frame: CGRect(x:30, y:65, width: 320, height: 15))
        branchAddressLbl.font = branchAddressLbl.font.withSize(12)
        self.addSubview(branchNameLbl!)
        self.addSubview(branchImageView!)
        self.addSubview(branchDistanceLbl!)
        self.addSubview(branchAddressLbl!)
    }
    func setValueForCell(model:BranchLink) {
        self.branchNameLbl.text = model.branchName!
        self.branchImageView.image = UIImage(named:model.branchIcon!)
        self.branchDistanceLbl.text = model.branchDistance!
        self.branchAddressLbl.text = model.branchAddress!
//        print("label branchImageView : " ,model.branchName)
//        print("label branchDistanceLbl : " ,model.branchDistance)
//        print("label branchNameLbl : " ,model.branchAddress)
//        print("label address : " ,self.branchAddressLbl)
        
    }

}
