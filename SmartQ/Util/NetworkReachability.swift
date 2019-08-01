//
//  NetworkReachability.swift
//  SmartQ
//
//  Created by 何大海 on 2019/5/7.
//  Copyright © 2019 tiny. All rights reserved.
//

import Foundation
import UIKit
import Alamofire


class NetworkReachability: NSObject {
    
    static let reachAbility = NetworkReachability()
    
    var reachAble:Bool = {
        var reach = true
        
        let manager = NetworkReachabilityManager(host: "www.baidu.com")
        
        manager?.listener = { status in
            switch status {
            case .notReachable:
                reach = false
                //SVProgressHUD.showError(withStatus: "网络出错")
                //let view =
                //view.show()
            case .reachable(.ethernetOrWiFi):
                reach = true
            case .reachable(.wwan):
                reach = true
            case .unknown:
                reach = false
                //SVProgressHUD.showError(withStatus: "网络出错")
            }
        }
        manager?.startListening()
        
        return reach
    }()
    
}
