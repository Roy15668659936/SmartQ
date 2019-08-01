//
//  ReserveViewController.swift
//  OnlineReservation
//
//  Created by Roy on 2019/6/3.
//  Copyright © 2019 citi. All rights reserved.
//

import UIKit

class ReserveViewController: BaseViewController,UITableViewDelegate,UITableViewDataSource {
    
    var branchItem:BranchLink?
    let defaultStand = UserDefaults.standard

    let buttonConfirm = UIButton(type:.custom)
    let optionName: [String] = ["取号预约","大额取现 (10万及以上)","虚拟柜员机 (ATM)"]
    let optionRemark: [String] = ["","(不可预约当天)","(2可用)"]
    var dateTime: [String] = ["","",""]
    let imgIcon: [String] = ["pepoicon","money","tickicon"]
    var reserveTable:ReserveSelectionTableView? = nil
    var reserveDataPick: ReserveDataPick? = nil
    var selectedTime = false
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = ReserveSelectionCell()
        //cell.textLabel!.text=options[(indexPath as NSIndexPath).row]
        if(optionName[(indexPath as NSIndexPath).row] != ""){
            if(optionName[(indexPath as NSIndexPath).row]=="取号预约"){
                cell.optionNameMid.text=optionName[(indexPath as NSIndexPath).row]
            }else if(optionName[(indexPath as NSIndexPath).row]=="大额取现 (10万及以上)"){
                cell.optionNameMid.text=optionName[(indexPath as NSIndexPath).row]
            }else{
                cell.optionName.text=optionName[(indexPath as NSIndexPath).row]
            }
        }
        if(optionRemark[(indexPath as NSIndexPath).row] != ""){
            cell.optionRemark.text=optionRemark[(indexPath as NSIndexPath).row]
        }
        if(dateTime[(indexPath as NSIndexPath).row] != ""){
            cell.dateTime.text=dateTime[(indexPath as NSIndexPath).row]
        }
        //cell.detailTextLabel?.text = "gaga"
        cell.imgIcon.image = UIImage(named:imgIcon[(indexPath as NSIndexPath).row])
        //UIImageView(image:UIImage(named:"pepoicon"))
        cell.accessoryType = ReserveSelectionCell.AccessoryType.disclosureIndicator
        return cell
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        let tabController = self.tabBarController as! TabbarController
//        tabController.addChildController(ChildController: viewController, Title: "排队取号", DefaultImage: UIImage(named:"history")!, SelectedImage: UIImage(named:"history")!)
//    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        super.setNavigation(Title: "预约")
        
        let reserveUIScrollView = ReserveUIScrollView.init(frame: CGRect(x:0, y:44, width:view.frame.width, height:view.frame.height - 94))
        reserveUIScrollView.backgroundColor = UIColor.white
        reserveUIScrollView.contentSize = CGSize(width: view.frame.width, height: 680)
        //        self.view = UIScrollView.init(frame: CGRect(x:0, y:0, width:view.frame.width, height:730))
        let reserveHeaderFrame = CGRect(x:0, y:0, width:view.frame.width, height:200)
        let reserveHeader = ReserveHeaderView(frame: reserveHeaderFrame)
        var bl = BranchLink()
        bl.branchId =  "1"
        bl.branchName = "花旗银行大连分行"
        bl.branchAddress = "大连市中山区港兴路6号"
        bl.branchIcon = "branch_green"
        bl.branchDistance =  "18.8 km"
       
       
        if self.branchItem != nil {
            reserveHeader.branchItem = self.branchItem
        }else{
            
            reserveHeader.branchItem = bl
        }
        
        reserveHeader.backgroundColor = UIColor.init(red: 102.0/255, green: 43.0/255, blue: 235.0/255, alpha: 1.0)
        reserveUIScrollView.addSubview(reserveHeader)
        
        reserveTable = ReserveSelectionTableView.init(frame:CGRect(x:10, y:200, width:view.frame.width - 20, height:160), style: ReserveSelectionTableView.Style.plain)
        
        reserveTable!.delegate = self
        reserveTable!.dataSource = self
        reserveUIScrollView.addSubview(reserveTable!)
        
        let reserveVoteUIView = ReserveVoteUIView.init(frame: CGRect(x:10, y:425, width:view.frame.width - 20, height:90))
        reserveUIScrollView.addSubview(reserveVoteUIView)
        
        
        let reserveVoteDetailsUIView  = ReserveVoteDetailsUIView.init(frame: CGRect(x:10, y:550, width:view.frame.width - 20, height:120))
        reserveVoteDetailsUIView.layer.masksToBounds = true
        reserveVoteDetailsUIView.layer.cornerRadius = 18;
        reserveVoteDetailsUIView.backgroundColor = UIColor.init(red: 230.0/255, green: 229.0/255, blue: 235.0/255, alpha: 1.0)
        reserveUIScrollView.addSubview(reserveVoteDetailsUIView)
        reserveUIScrollView.sizeThatFits(CGSize(width: view.frame.width, height: 720))
        self.view.addSubview(reserveUIScrollView);
        //        self.view.addSubview(myDatePicker)
        reserveDataPick = ReserveDataPick.init(frame: CGRect(x: 1, y: 0, width: view.frame.width - 20, height: 260))
        
        // 创建一个常规的button
        
        buttonConfirm.frame = CGRect(x:10, y:375, width:view.frame.width - 20, height:35)
        buttonConfirm.setTitle("立即预约", for: .normal)
        buttonConfirm.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        buttonConfirm.setTitleColor(UIColor.gray, for: .normal)
        buttonConfirm.addTarget(self, action: #selector(buttonConfirmClick), for: .touchUpInside)
        
        buttonConfirm.layer.borderColor = UIColor.gray.cgColor
        
        buttonConfirm.layer.borderWidth = 2;
        
        buttonConfirm.layer.cornerRadius = 16;
        reserveUIScrollView.addSubview(buttonConfirm)
        
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if((indexPath as NSIndexPath).row == 0){
            reserveDataPick?.secondDay=""
            let alertController:UIAlertController=UIAlertController(title: "\n\n\n\n\n\n\n\n\n\n\n\n", message: nil, preferredStyle: UIAlertController.Style.actionSheet)
            alertController.addAction(UIAlertAction(title: "确定", style: UIAlertAction.Style.default){
                (alertAction)->Void in
                self.dateTime[0] = "今天  " + self.reserveDataPick!.selectedTime
                self.dateTime[1] = ""
                print(self.dateTime[0])
                self.reserveTable?.reloadData()
                self.buttonConfirm.setTitleColor(UIColor.blue, for: .normal)
                self.buttonConfirm.layer.borderColor = UIColor.blue.cgColor
                self.selectedTime = true
            })
            alertController.addAction(UIAlertAction(title: "取消", style: UIAlertAction.Style.cancel,handler:nil))
            alertController.view.addSubview(reserveDataPick!)
            
            self.present(alertController, animated: true, completion: nil)
        }
        if((indexPath as NSIndexPath).row == 1){
            reserveDataPick?.secondDay="selected"
            let alertController:UIAlertController=UIAlertController(title: "\n\n\n\n\n\n\n\n\n\n\n\n", message: nil, preferredStyle: UIAlertController.Style.actionSheet)
            alertController.addAction(UIAlertAction(title: "确定", style: UIAlertAction.Style.default){
                (alertAction)->Void in
                self.dateTime[1] = "明天  " + self.reserveDataPick!.selectedTime
                self.dateTime[0] = ""
                print(self.dateTime[1])
                self.reserveTable?.reloadData()
                self.buttonConfirm.setTitleColor(UIColor.blue, for: .normal)
                self.buttonConfirm.layer.borderColor = UIColor.blue.cgColor
                self.selectedTime = true
                
            })
            alertController.addAction(UIAlertAction(title: "取消", style: UIAlertAction.Style.cancel,handler:nil))
            alertController.view.addSubview(reserveDataPick!)
            
            self.present(alertController, animated: true, completion: nil)
        }
    }
    //无参数点击事件
    @objc func buttonConfirmClick(){
        if selectedTime{
            let viewController = TicketViewController()
            viewController.branchItem = self.branchItem
            self.navigationController?.pushViewController(viewController, animated: true)
        }
    }
    
}

