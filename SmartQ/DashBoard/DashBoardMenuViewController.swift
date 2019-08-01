//
//  DashBoardMenuViewController.swift
//  SmartQ
//
//  Created by Roy on 2019/7/24.
//  Copyright © 2019 tiny. All rights reserved.
//

import UIKit

class DashBoardMenuViewController: UIViewController {

    //view list
    var listItems = ["cardSummary"]
    var listViewController:[UIViewController] = []
    
    var baseVC:DashBoardBaseViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let menuheaderView = UIImageView(image:UIImage(named:"menuheader"))
        menuheaderView.frame = CGRect(x:0, y:22, width:self.view.frame.width-70,height:131)
        let menuBodyImageView = UIImageView(image:UIImage(named:"menuBodyView"))
        menuBodyImageView.frame = CGRect(x:0, y:0, width:self.view.frame.width-70,height:700)
        
        let menuBodyScrollView = UIScrollView.init(frame: CGRect(x:0, y:153, width:view.frame.width, height:view.frame.height - 153))
        menuBodyScrollView.contentSize = CGSize(width: view.frame.width - 70, height: 700)

        menuBodyScrollView.addSubview(menuBodyImageView)
        menuBodyScrollView.sizeThatFits(CGSize(width: view.frame.width - 70, height: 700))
        menuBodyScrollView.backgroundColor = UIColor(red: 239/255, green: 239/255, blue: 239/255, alpha: 1)

        let buttonSmartQMenu = UIButton(type:.custom)
        buttonSmartQMenu.frame = CGRect(x:0, y:650, width: view.frame.width - 70, height:30)
        buttonSmartQMenu.addTarget(self, action: #selector(buttonSmartQMenuClick), for: .touchUpInside)
        menuBodyScrollView.addSubview(buttonSmartQMenu)
        
        self.view.addSubview(menuheaderView)
        self.view.addSubview(menuBodyScrollView)
    }
    
    @objc func buttonSmartQMenuClick(){
        let tabbar = TabbarController()
        self.present(tabbar, animated: true, completion: nil)

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func createListViewConroller(){
        //other screen can be defined here
        let cardSummaryVC = CardSummaryViewController()
        listViewController.append(cardSummaryVC)

    }
//    override func viewWillAppear(_ animated: Bool) {
//        UIView.animate(withDuration: 0.5, animations: { () -> Void in
//            self.view.layoutIfNeeded()
//        })
//    }
}

extension DashBoardMenuViewController:UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listItems.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! MenuCell
        cell.lblMenu.text = listItems[(indexPath as NSIndexPath).row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        baseVC!.contentVC = listViewController[(indexPath as NSIndexPath).row]
        baseVC?.leftMargin.constant = 0
    }
}
