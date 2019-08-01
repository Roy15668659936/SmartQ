//
//  TicketViewController.swift
//  Confirmation
//
//  Created by Roy on 2019/5/18.
//  Copyright © 2019 Roy. All rights reserved.
//

import UIKit
import MapKit
class TicketViewController: BaseViewController {
    
    var branchItem:BranchLink?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        super.setNavigation(Title: "网店预约")
        super.title = "网店预约"
        
        view.backgroundColor = UIColor.init(red: 226.0/255, green: 227.0/255, blue: 228.0/255, alpha: 1.0)
        let confirmFrame = CGRect(x:view.frame.width/2 - 240/2, y:view.frame.height/2 - 450/2 + 15, width:240, height:440)
        let confirmView = TicketConfirmView(frame: confirmFrame)
        confirmView.backgroundColor  = UIColor.init(red: 226.0/255, green: 227.0/255, blue: 228.0/255, alpha: 1.0)
        let successBackImg = UIImageView(image:UIImage(named:"greenground"))
        successBackImg.frame = CGRect(x:confirmView.frame.width/2 - 150/2, y:240*0.4 - 130/2, width:150, height:130)
        let successFrontImg = UIImageView(image:UIImage(named:"confirmed"))
        successFrontImg.frame = CGRect(x:confirmView.frame.width/2 - 120/2, y:240*0.4 - 100/2, width:120, height:100)
        view.addSubview(confirmView)
        confirmView.addSubview(successBackImg)
        confirmView.addSubview(successFrontImg)
        let num = arc4random_uniform(100000)
        let label1 = UILabel(frame:CGRect(x:30, y:10 + 450 * 0.4 + 40, width:confirmView.frame.width - 60, height:50))
        let label2 = UILabel(frame:CGRect(x:30, y:60 + 450 * 0.4 + 30, width:confirmView.frame.width - 60, height:30))
        let label3 = UILabel(frame:CGRect(x:30, y:90 + 450 * 0.4 + 30, width:confirmView.frame.width - 60, height:30))
        let label4 = UILabel(frame:CGRect(x:0, y:140 + 450 * 0.4 + 30, width:confirmView.frame.width, height:50))
        let bl = BranchLink()
        bl.branchId =  "1"
        bl.branchName = "花旗银行大连分行"
        bl.branchAddress = "大连市中山区港兴路6号"
        bl.branchIcon = "branch_green"
        bl.branchDistance =  "18.8 km"
        
        
        if self.branchItem != nil {
            label1.text = self.branchItem?.branchName
        }else{
            label1.text = bl.branchName
        }
        label1.font=UIFont(name:"Thonburi",size:15)
        label1.numberOfLines=0
        label1.lineBreakMode = NSLineBreakMode.byWordWrapping
        label2.text = "*Teller"
        label2.font=UIFont(name:"Thonburi",size:12)
        let date = Date()
        let timeFormatter = DateFormatter()
        //日期显示格式，可按自己需求显示
        timeFormatter.dateFormat = "yyy-MM-dd' 'HH:mm"
        label3.text = timeFormatter.string(from: date) as String
        label4.text = "A" + String(num)
        label4.font=UIFont(name:"Thonburi",size:30)
        label4.textAlignment=NSTextAlignment.center
        var labColor=UIColor(white:1,alpha:1);
        labColor=UIColor.init(red:255.0/255,green:255.0/255,blue:0.0/255,alpha:1)
        labColor=UIColor.lightText
        labColor=UIColor.orange;
        label4.textColor=labColor
        confirmView.addSubview(label1);
        //confirmView.addSubview(label2);
        confirmView.addSubview(label3);
        confirmView.addSubview(label4);
        
        // 创建一个常规的button
        let buttonLeft = UIButton(type:.custom)
        buttonLeft.frame = CGRect(x:30, y:200 + 450 * 0.4 + 20, width:60, height:30)
        buttonLeft.setTitle("出行建议", for: .normal)
        buttonLeft.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        buttonLeft.setTitleColor(UIColor.blue, for: .normal)
        buttonLeft.addTarget(self, action: #selector(buttonLeftClick), for: .touchUpInside)
        confirmView.addSubview(buttonLeft)
        
        let buttonRight = UIButton(type:.custom)
        buttonRight.frame = CGRect(x: confirmView.frame.width - 90, y:200 + 450 * 0.4 + 20, width:60, height:30)
        buttonRight.setTitle("在线填单", for: .normal)
        buttonRight.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        buttonRight.setTitleColor(UIColor.blue, for: .normal)
        //无参数点击事件
        buttonRight.addTarget(self, action: #selector(buttonRightClick), for: .touchUpInside)
        //带button参数传递
        //buttonRight.addTarget(self, action: #selector(buttonClick(button:)), for: .touchUpInside)
        confirmView.addSubview(buttonRight)
    }
    
    
    
    //无参数点击事件
    @objc func buttonLeftClick(){
        print("点击了left button")
        jumpToMapClicked()
//        let mlVC = MapLocantionViewController()
//        self.navigationController?.pushViewController(mlVC, animated: true)
    }
    //无参数点击事件
    @objc func buttonRightClick(){
        print("点击了right button")
        let preformVC = PreformViewController()
//        self.present(preformVC, animated: false, completion: nil)
        self.navigationController?.pushViewController(preformVC, animated: true)
    }
    //带参数点击事件
    //    @objc func buttonClick(button:UIButton ){
    //        button.isSelected = !button.isSelected
    //        if button.isSelected {
    //            button.setTitle("Selected", for: .normal)
    //        }else{
    //            button.setTitle("NoSelected", for: .normal)
    //        }
    //    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        let tc = self.tabBarController as! TabbarController
//        tc.addChildController(ChildController: self, Title: "排队取号", DefaultImage: UIImage(named:"history")!, SelectedImage: UIImage(named:"history")!)
//        
//        tc.tabBarItem[1] = self
//    }
    
    
    // MARK: - Action
    @objc func jumpToMapClicked() {
        
        let latitute = 38.928345
        let longitute = 121.670058
        let endAddress = "大连市中山区港兴路6号"
        
        let alter = UIAlertController.init(title: "请选择导航应用程序", message: "", preferredStyle: UIAlertControllerStyle.actionSheet)
        
        let cancle = UIAlertAction.init(title: "取消", style: UIAlertActionStyle.cancel) { (a) in
        }
        
        let action1 = UIAlertAction.init(title: "苹果地图", style: UIAlertActionStyle.default) { (b) in
            self.appleMap(lat: latitute, lng: longitute, destination: endAddress)
        }
        
        let action2 = UIAlertAction.init(title: "高德地图", style: UIAlertActionStyle.default) { (b) in
            self.amap(dlat: latitute, dlon: longitute, dname: endAddress, way: 0)
        }
        
        let action3 = UIAlertAction.init(title: "百度地图", style: UIAlertActionStyle.default) { (b) in
            
            self.baidumap(endAddress: endAddress, way: "driving", lat: latitute,lng: longitute)
        }
        
        alter.addAction(action1)
        alter.addAction(action2)
        alter.addAction(action3)
        alter.addAction(cancle)
        
        self.present(alter, animated: true, completion: nil)
    }
    
    
    // 打开苹果地图
    func appleMap(lat:Double,lng:Double,destination:String){
        let loc = CLLocationCoordinate2DMake(lat, lng)
        let currentLocation = MKMapItem.forCurrentLocation()
        let toLocation = MKMapItem(placemark:MKPlacemark(coordinate:loc,addressDictionary:nil))
        toLocation.name = destination
        MKMapItem.openMaps(with: [currentLocation,toLocation], launchOptions: [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving,MKLaunchOptionsShowsTrafficKey: "true"])
        
    }
    
    // 打开高德地图
    func amap(dlat:Double,dlon:Double,dname:String,way:Int) {
        
        let appName = "高德地图"
        
        let urlString = "iosamap://path?sourceApplication=\(appName)&dname=\(dname)&dlat=\(dlat)&dlon=\(dlon)&t=\(way)" as NSString

        if self.openMap(urlString) == false {
            print("您还没有安装高德地图")
            
        }
    }
    
    // 打开百度地图
    func baidumap(endAddress:String,way:String,lat:Double,lng:Double) {
        
        let coordinate = CLLocationCoordinate2DMake(lat, lng)
        
        
        let baidu_coordinate = getBaiDuCoordinateByGaoDeCoordinate(coordinate: coordinate)
        
        let destination = "\(baidu_coordinate.latitude),\(baidu_coordinate.longitude)"
        
        
        let urlString = "baidumap://map/direction?" + "&destination=" + endAddress + "&mode=" + way + "&destination=" + destination
        
        let str = urlString as NSString
        
        if self.openMap(str) == false {
            print("您还没有安装百度地图")
        }
    }
    
    // 打开第三方地图
    private func openMap(_ urlString: NSString) -> Bool {
        
        
        let url = NSURL(string:urlString.addingPercentEscapes(using: String.Encoding.utf8.rawValue)!)
        
        if UIApplication.shared.canOpenURL(url! as URL) == true {
            UIApplication.shared.openURL(url! as URL)
            return true
        } else {
            return false
        }
    }
    
    // 高德经纬度转为百度地图经纬度
    func getBaiDuCoordinateByGaoDeCoordinate(coordinate:CLLocationCoordinate2D) -> CLLocationCoordinate2D {
        return CLLocationCoordinate2DMake(coordinate.latitude + 0.006, coordinate.longitude + 0.0065)
    }
    
   
}

