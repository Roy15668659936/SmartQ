//
//  MapLocationViewController.swift
//  SmartQ
//
//  Created by Roy on 2019/7/28.
//  Copyright © 2019 tiny. All rights reserved.
//
import UIKit
import CoreLocation
import MapKit

class MapLocantionViewController: UIViewController ,CLLocationManagerDelegate {
    
    var labelAddress: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelAddress = UILabel(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 800))
//        labelAddress.text = bankItem.address
//        labelAddress.font = UIFont.systemFont(ofSize: 14)
//        labelAddress.textColor = UIColor.white
        self.view.addSubview(labelAddress)
        locationEncode()
    }
    
    //地理信息编码
    func locationEncode(){
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString("大连市中山区港兴路6号", completionHandler: {
            (placemarks:[CLPlacemark]?, error:Error?) -> Void in
            
            if error != nil {
                self.labelAddress.text = "错误：\(error!.localizedDescription))"
                return
            }
            if let p = placemarks?[0]{
                self.labelAddress.text = "经度：\(p.location!.coordinate.longitude)   " + "纬度：\(p.location!.coordinate.latitude)"
            } else {
                print("No placemarks!")
            }
        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
