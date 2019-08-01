//
//  Bank.swift
//  SmartQ
//
//  Created by 何大海 on 2019/6/10.
//  Copyright © 2019 tiny. All rights reserved.
//

import Foundation

class Bank: NSObject {
    var id: String
    var address: String
    var tel: String
    var openWeek: String
    var openTime: String
    
    init(id: String, address: String, tel: String, openWeek: String, openTime: String) {
        self.id = id
        self.address = address
        self.tel = tel
        self.openWeek = openWeek
        self.openTime = openTime
        
    }
}
