//
//  ViewController.swift
//  SmartQ
//
//  Created by 何大海 on 2019/6/10.
//  Copyright © 2019 tiny. All rights reserved.
//

import Foundation
import UIKit

class BankDetailController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    var dataSource = [[String:String]()]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellid = "testCellID"
        var cell:BankDetailTableCell? = tableView.dequeueReusableCell(withIdentifier: cellid) as? BankDetailTableCell
        if cell==nil {
            cell = BankDetailTableCell(style: .subtitle, reuseIdentifier: cellid)
        }
        let dict:Dictionary = dataSource[indexPath.row]
        cell?.iconImv.image = UIImage(named: dict["icon"]!)
        cell?.titleLabel.text = dict["title"]
        cell?.timeLabel.text = dict["time"]
        cell?.subTitleLabel.text = dict["subTitle"]
        return cell!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //header section
        let screenw = UIScreen.main.bounds.width;
        let screenh = UIScreen.main.bounds.height;
        let headerView = UIView();
        headerView.backgroundColor = UIColor(red: 0.0, green: 0.451, blue: 0.799, alpha: 1)
        headerView.frame = CGRect(x: 0, y: 0, width: screenw, height: 50);
        self.view.addSubview(headerView);
        
        //bank info section
        let bankDetailView = UIView();
        bankDetailView.backgroundColor = UIColor(red: 0.404, green: 0.167, blue: 0.921, alpha: 1)
        bankDetailView.frame = CGRect(x: 0, y: 50, width: screenw, height: 220);
        self.view.addSubview(bankDetailView);
        
        let mapImg = UIImage(named: "map")
        let mapImageView = UIImageView(frame: self.view.frame)
        mapImageView.frame = CGRect(x: 20, y: 20, width: 30, height: 30)
        mapImageView.image = mapImg
        mapImageView.contentMode = .scaleAspectFit
        bankDetailView.addSubview(mapImageView)
        
        let bankItem = Bank(id: "001", address: "大连市中山区东港路86号万达大厦1楼", tel: "(+86)0411 36674211", openWeek: "周一 到 周五", openTime: "8:00 上午 - 5:00 下午")
        
        let labelAddress = UILabel(frame: CGRect(x: 75, y: 25, width: 500, height: 10))
        labelAddress.text = bankItem.address
        labelAddress.font = UIFont.systemFont(ofSize: 14)
        labelAddress.textColor = UIColor.white
        bankDetailView.addSubview(labelAddress)
        
        let labelTelTitle = UILabel(frame: CGRect(x: 75, y: 80, width: 500, height: 10))
        labelTelTitle.text = "电话:"
        labelTelTitle.font = UIFont.systemFont(ofSize: 14)
        labelTelTitle.textColor = UIColor.white
        bankDetailView.addSubview(labelTelTitle)
        
        let labelTel = UILabel(frame: CGRect(x: 150, y: 80, width: 500, height: 10))
        labelTel.text = bankItem.tel
        labelTel.font = UIFont.systemFont(ofSize: 14)
        labelTel.textColor = UIColor.white
        bankDetailView.addSubview(labelTel)
        
        let labelTimeTitle = UILabel(frame: CGRect(x: 75, y: 120, width: 500, height: 10))
        labelTimeTitle.text = "营业时间:"
        labelTimeTitle.font = UIFont.systemFont(ofSize: 14)
        labelTimeTitle.textColor = UIColor.white
        bankDetailView.addSubview(labelTimeTitle)
        
        let labelWeek = UILabel(frame: CGRect(x: 150, y: 120, width: 500, height: 10))
        labelWeek.text = bankItem.openWeek
        labelWeek.font = UIFont.systemFont(ofSize: 14)
        labelWeek.textColor = UIColor.white
        bankDetailView.addSubview(labelWeek)
        
        let labelTime = UILabel(frame: CGRect(x: 150, y: 145, width: 500, height: 10))
        labelTime.text = bankItem.openTime
        labelTime.font = UIFont.systemFont(ofSize: 14)
        labelTime.textColor = UIColor.white
        bankDetailView.addSubview(labelTime)
        
        //reservation section
        let tableView = UITableView(frame: CGRect(x: 0, y: 220, width: screenw, height: 220), style: .grouped)
        tableView.backgroundColor = UIColor.white;
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        
        dataSource = [
            ["title":"取号预约","time":"今天,10:40 - 11:00","icon":"plus-circle","subTitle":""],
            ["title":"大额取现(10万及以上)","time":"","icon":"plus-circle","subTitle":"(不可预约当天)"],
            ["title":"虚拟柜员机(ATM)","time":"","icon":"plus-circle","subTitle":"(2可用)"]]
        tableView.reloadData()
        
        
        //rank
        let rankImg = UIImage(named: "rank")
        let rankImageView = UIImageView(frame: self.view.frame)
        rankImageView.frame = CGRect(x: 0, y: 300, width: screenw, height: screenh)
        rankImageView.image = rankImg
        rankImageView.contentMode = .scaleAspectFit
        view.addSubview(rankImageView)
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
    
}
