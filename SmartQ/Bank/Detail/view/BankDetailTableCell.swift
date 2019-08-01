//
//  TableCell.swift
//  SmartQ
//
//  Created by 何大海 on 2019/6/10.
//  Copyright © 2019 tiny. All rights reserved.
//

import Foundation
import UIKit

class BankDetailTableCell: UITableViewCell {
    
    let width:CGFloat = UIScreen.main.bounds.width
    var titleLabel:UILabel!
    var subTitleLabel:UILabel!
    var timeLabel:UILabel!
    var iconImv:UIImageView!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        iconImv = UIImageView(frame: CGRect(x: 20, y: 15, width: 22, height: 22))
        iconImv.layer.masksToBounds = true
        iconImv.layer.cornerRadius = 22.0
        iconImv.contentMode = .scaleAspectFit
        
        titleLabel = UILabel(frame: CGRect(x: 74, y: 18, width: 300, height: 15))
        titleLabel.textColor = UIColor.black
        titleLabel.font = UIFont.boldSystemFont(ofSize: 15)
        titleLabel.textAlignment = .left
        
        timeLabel = UILabel(frame: CGRect(x: 150, y: 20, width: 300, height: 13))
        timeLabel.textColor = UIColor.black
        timeLabel.font = UIFont.systemFont(ofSize: 13)
        timeLabel.textAlignment = .left
        
        subTitleLabel = UILabel(frame: CGRect(x: 74, y: 37, width: width-94, height: 13))
        subTitleLabel.textColor = UIColor.gray
        subTitleLabel.font = UIFont.systemFont(ofSize: 12)
        subTitleLabel.textAlignment = .left
        
        contentView.addSubview(iconImv)
        contentView.addSubview(titleLabel)
        contentView.addSubview(timeLabel)
        contentView.addSubview(subTitleLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
