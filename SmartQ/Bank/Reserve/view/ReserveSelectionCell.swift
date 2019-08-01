//
//  ReserveSelectionCell
//  OnlineReservation
//
//  Created by Roy on 2019/6/3.
//  Copyright © 2019 citi. All rights reserved.
//


import UIKit

class ReserveSelectionCell: UITableViewCell {
    open var optionName:UILabel!
    open var optionNameMid:UILabel!
    open var optionRemark:UILabel!
    open var dateTime:UILabel!
    open var imgIcon:UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    override init(style: ReserveSelectionCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        // self.selectionStyle = UITableViewCell.SelectionStyle.none
        self.createCellUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func createCellUI(){
        imgIcon = UIImageView(frame: CGRect(x:3, y:10, width: 30, height: 30))
        optionName = UILabel.init(frame: CGRect(x:35, y:10, width: 150, height: 15))
        optionNameMid = UILabel.init(frame: CGRect(x:35, y:15, width: 150, height: 15))
        optionRemark = UILabel.init(frame: CGRect(x:35, y:32, width: 150, height: 10))
        dateTime = UILabel.init(frame: CGRect(x:190, y:15, width: 125, height: 15))
//         optionRemark.adjustsFontSizeToFitWidth=true
        optionName.font = optionRemark.font.withSize(14)
        optionRemark.font = optionRemark.font.withSize(10)
        dateTime.font = optionRemark.font.withSize(15)

        self.contentView.addSubview(imgIcon)
        self.contentView.addSubview(optionName)
        self.contentView.addSubview(optionNameMid)
        self.contentView.addSubview(optionRemark)
        self.contentView.addSubview(dateTime)
        
    }
    
}
