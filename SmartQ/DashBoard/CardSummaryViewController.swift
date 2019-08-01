//
//  RedViewController.swift
//  SmartQ
//
//  Created by Roy on 2019/7/25.
//  Copyright © 2019 tiny. All rights reserved.
//

import UIKit

class CardSummaryViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 250/255, green: 250/255, blue: 250/255, alpha: 1)
        let cardsummaryView = UIImageView(image:UIImage(named:"cardsummary"))
        cardsummaryView.center.x = self.view.center.x
        cardsummaryView.center.y = self.view.center.y + 50
        self.view.addSubview(cardsummaryView)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
