//
//  PreformViewController.swift
//  SmartQ
//
//  Created by Roy on 2019/7/26.
//  Copyright © 2019 tiny. All rights reserved.
//

import UIKit

class PreformViewController: UIViewController , UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate{
    
    var tableView:UITableView?
    
    var allnames:Dictionary<Int, [String]>?
    
    var adHeaders:[String]?
    
    var bankNameList:[String]?
    
    var serviceList:[String]?

    let buttonConfirm = UIButton(type:.custom)
    
    let defaultStand = UserDefaults.standard

    let textField1 = UITextField(frame: CGRect(x: 120, y: 5, width: 180, height: 35))
    let textField2 = UITextField(frame: CGRect(x: 120, y: 5, width: 180, height: 35))
    let textField3 = UITextField(frame: CGRect(x: 120, y: 5, width: 180, height: 35))
    let textField4 = UITextField(frame: CGRect(x: 120, y: 5, width: 180, height: 35))
    let textField5 = UITextField(frame: CGRect(x: 120, y: 5, width: 180, height: 35))
    let textField6 = UITextField(frame: CGRect(x: 120, y: 5, width: 180, height: 35))

    override func loadView() {
        super.loadView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        super.navigationController?.view.backgroundColor = UIColor.blue
        super.title = "网店预约"
        //初始化数据
        self.allnames =  [
            0:[String]([
                "服务类型"])
        ];
        
        print(self.allnames)
        
        self.adHeaders = [
            "在线填单1",
            "在线填单2",
            "在线填单3"
        ]
        
        self.serviceList = [
            "转账汇款",
            "生活缴费",
            "现金支票"
        ]
        
        self.bankNameList = [
            "招商银行",
            "工商银行",
            "交通银行",
            "农业银行",
            
        ]
        
        //创建表视图
        let tableGC = CGRect(x:0, y:0, width:view.frame.width, height:view.frame.height - 80)
        self.tableView = UITableView(frame:tableGC, style:.grouped)
        self.tableView!.delegate = self
        self.tableView!.dataSource = self
        //创建一个重用的单元格
        self.tableView!.register(UITableViewCell.self,
                                 forCellReuseIdentifier: "SwiftCell")
        self.view.addSubview(self.tableView!)
        
        //创建表头标签
//        let headerLabel = UILabel(frame: CGRect(x:0, y:0, width:self.view.bounds.size.width, height:20))
//        headerLabel.backgroundColor = UIColor.init(red: 28/250, green: 123/250, blue: 200/250, alpha: 1.0)
//        headerLabel.textColor = UIColor.white
//        headerLabel.numberOfLines = 0
//        headerLabel.lineBreakMode = .byWordWrapping
//        headerLabel.text = "在线填单"
//        headerLabel.font = UIFont.italicSystemFont(ofSize: 20)
        let headerFrame = CGRect(x:0, y:view.frame.height - 70, width:self.view.frame.width, height:20)
        let headerView = UIView.init(frame: headerFrame)
        self.view.addSubview(headerView)
        self.tableView!.tableHeaderView = headerView
        self.navigationItem.titleView?.addSubview(headerView)
        let item = UIBarButtonItem(title: "返回", style: .plain, target: self, action: nil)
        self.navigationItem.backBarButtonItem = item
        self.navigationController?.view.addSubview(headerView)

        buttonConfirm.frame = CGRect(x:15, y:view.frame.height - 90, width:view.frame.width - 30, height:35)
        buttonConfirm.setTitle("提交填单", for: .normal)
        buttonConfirm.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        buttonConfirm.setTitleColor(UIColor.gray, for: .normal)
        buttonConfirm.addTarget(self, action: #selector(buttonConfirmClick), for: .touchUpInside)
        buttonConfirm.layer.borderColor = UIColor.blue.cgColor
        buttonConfirm.backgroundColor = UIColor.blue
        self.buttonConfirm.titleLabel?.textColor = UIColor.white

        buttonConfirm.layer.borderWidth = 2;
        
        buttonConfirm.layer.cornerRadius = 16;
        self.view.backgroundColor = UIColor.init(red: 239/250, green: 239/250, blue: 244/250, alpha: 1.0)
        self.view.addSubview(buttonConfirm)
        
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action:#selector(handleTap)))

    }
    
    //在本例中，有2个分区
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.allnames!.count;
    }
    
    //返回表格行数（也就是返回控件数）
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let data = self.allnames?[section]
        return data!.count
    }
    
    // UITableViewDataSource协议中的方法，该方法的返回值决定指定分区的头部
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int)
//        -> String? {
//            return self.adHeaders?[section]
//    }
    
    // UITableViewDataSource协议中的方法，该方法的返回值决定指定分区的尾部
//    func tableView(_ tableView:UITableView, titleForFooterInSection section:Int)->String? {
//        let data = self.allnames?[section]
//        return "有\(data!.count)个控件"
//    }
    
    //创建各单元显示内容(创建参数indexPath指定的单元）
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)
        -> UITableViewCell {
            //为了提供表格显示性能，已创建完成的单元需重复使用
            let identify:String = "SwiftCell"
            //同一形式的单元格重复使用，在声明时已注册
            let cell = tableView.dequeueReusableCell(
                withIdentifier: identify, for: indexPath)
            
            let secno = indexPath.section
            var data = self.allnames?[secno]
            cell.textLabel?.text = data![indexPath.row]
            
            if indexPath.section == 0 && indexPath.row == 0{
                cell.accessoryType = .disclosureIndicator
            }else if indexPath.section == 1 && indexPath.row == 0{
                cell.accessoryType = .disclosureIndicator
            }else if indexPath.section == 1 && indexPath.row == 1{
                textField1.borderStyle = UITextBorderStyle.roundedRect
                textField1.keyboardAppearance = UIKeyboardAppearance.default
                textField1.returnKeyType = UIReturnKeyType.done
                textField1.textAlignment = .center
                
                textField1.text = defaultStand.string(forKey: FormInfo().userName)
                
                textField1.delegate = self
                cell.contentView.addSubview(textField1)
            }else if indexPath.section == 1 && indexPath.row == 2{
                textField2.borderStyle = UITextBorderStyle.roundedRect
                textField2.keyboardAppearance = UIKeyboardAppearance.light
                textField2.returnKeyType = UIReturnKeyType.done
                textField2.textAlignment = .center
                
                textField2.keyboardType = UIKeyboardType.decimalPad
                textField2.text = defaultStand.string(forKey: FormInfo().cardNumber)
                
                textField2.delegate = self
                cell.contentView.addSubview(textField2)
            }else if indexPath.section == 1 && indexPath.row == 3{
                textField3.borderStyle = UITextBorderStyle.roundedRect
                textField3.keyboardAppearance = UIKeyboardAppearance.light
                textField3.returnKeyType = UIReturnKeyType.done
                textField3.textAlignment = .center
                
                textField3.keyboardType = UIKeyboardType.decimalPad
                textField3.text = defaultStand.string(forKey: FormInfo().transferAmo)
                
                textField3.delegate = self
                cell.contentView.addSubview(textField3)
            }else if indexPath.section == 2 && indexPath.row == 0{
                textField4.borderStyle = UITextBorderStyle.roundedRect
                textField4.keyboardAppearance = UIKeyboardAppearance.default
                textField4.returnKeyType = UIReturnKeyType.done
                textField4.textAlignment = .center
                
                textField4.text = defaultStand.string(forKey: FormInfo().messgeInfo)
                
                textField4.delegate = self
                cell.contentView.addSubview(textField4)
            }else if indexPath.section == 2 && indexPath.row == 1{
                textField5.borderStyle = UITextBorderStyle.roundedRect
                textField5.keyboardAppearance = UIKeyboardAppearance.default
                textField5.returnKeyType = UIReturnKeyType.done
                textField5.textAlignment = .center
                
                textField5.text = defaultStand.string(forKey: FormInfo().remark)
                
                textField5.delegate = self
                cell.contentView.addSubview(textField5)
            }else{

            }
            
            return cell
    }
    
    // UITableViewDelegate 方法，处理列表项的选中事件
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.tableView!.deselectRow(at: indexPath, animated: true)
//        let itemString = self.allnames![indexPath.section]![indexPath.row]
//        let alertController = UIAlertController(title: "提示!",
//                                                message: "你选中了【\(itemString)】",
//            preferredStyle: .alert)
//        let cancelAction = UIAlertAction(title: "确定", style: .cancel, handler: nil)
//        alertController.addAction(cancelAction)
//        self.present(alertController, animated: true, completion: nil)
        if indexPath.section == 0 && indexPath.row == 0{
            let alertController = UIAlertController(title: "请选择服务类型", message: "", preferredStyle: UIAlertControllerStyle.alert)
            let action = UIAlertAction(title: "取消", style:UIAlertActionStyle.cancel, handler: nil)
            alertController.addAction(action)
            for serviceItem in self.serviceList!{
                let action = UIAlertAction(title: serviceItem, style:UIAlertActionStyle.default, handler: serviceSelectClick)
                alertController.addAction(action)
                
            }
            self.present(alertController, animated: true, completion: nil)

        }
        if indexPath.section == 1 && indexPath.row == 0{
            let alertController = UIAlertController(title: "请选择银行", message: "", preferredStyle: UIAlertControllerStyle.alert)
            let action = UIAlertAction(title: "取消", style:UIAlertActionStyle.cancel, handler: nil)
            alertController.addAction(action)
            for bankItem in self.bankNameList!{
                let actionAlert = UIAlertAction(title: bankItem, style:UIAlertActionStyle.default, handler: bankSelectClick)
                alertController.addAction(actionAlert)

            }
            self.present(alertController, animated: true, completion: nil)
        }
        /*
        if indexPath.section == 2 ||  indexPath.row > 0{
            var tempContent = self.allnames![indexPath.section]![indexPath.row]
            let index = tempContent.index(tempContent.startIndex, offsetBy: 4)
            let prefix = self.allnames![indexPath.section]![indexPath.row].substring(to: index)
            let alertController = UIAlertController(title: prefix, message: nil, preferredStyle: UIAlertControllerStyle.alert)
            alertController.addTextField(configurationHandler: { (textField: UITextField!) -> Void in
//                textField.placeholder = "姓名"
                // 添加监听代码，监听文本框变化时要做的操作
//                NotificationCenter.default.addObserver(self, selector: #selector(self.alertTextFieldDidChange), name: NSNotification.Name.UITextFieldTextDidChange, object: textField)
            })
            let cancelAction = UIAlertAction(title: "取消", style: UIAlertActionStyle.cancel, handler: nil)
            let okAction = UIAlertAction(title: "确认", style: UIAlertActionStyle.default , handler: { (action: UIAlertAction!) -> Void in
                let inputText = (alertController.textFields?.first)! as UITextField
                inputText.keyboardType = .namePhonePad
                var tempContent = self.allnames![indexPath.section]![indexPath.row]
                
                let index = tempContent.index(tempContent.startIndex, offsetBy: 4)
                let prefix = self.allnames![indexPath.section]![indexPath.row].substring(to: index)
                
                self.allnames![indexPath.section]![indexPath.row] = prefix + "                    " + inputText.text!
                self.tableView?.reloadData()

//                NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UITextFieldTextDidChange, object: nil)
            })
//            okAction.isEnabled = false
            alertController.addAction(cancelAction)
            alertController.addAction(okAction)
            self.present(alertController, animated: true, completion: nil)
        }
            */
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func serviceSelectClick(alerAction:UIAlertAction){
        self.allnames =  [
            0:[String]([
                "服务类型                    " + alerAction.title!]),
            1:[String]([
                "转入银行",
                "转入户名",
                "转入卡号",
                "转账金额"])
            ,
            2:[String]([
                "短信通知",
                "转账附言"])
        ];
        self.tableView?.reloadData()
        self.buttonConfirm.layer.borderColor = UIColor.blue.cgColor
        self.buttonConfirm.titleLabel?.textColor = UIColor.white
    }
    
    func bankSelectClick(alerAction:UIAlertAction){
        self.allnames![1]![0] =  "转入银行                    " + alerAction.title!
        self.tableView?.reloadData()
    }
    
    //无参数点击事件
    @objc func buttonConfirmClick(){
        
        
        
        let alertController = UIAlertController(title: "保存成功!",
                                                message: nil, preferredStyle: .alert)
        //显示提示框
        self.present(alertController, animated: true, completion: nil)
        //两秒钟后自动消失
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1.5) {
            self.presentedViewController?.dismiss(animated: false, completion: nil)
            self.navigationController?.popViewController(animated: true)
        }
    }
    func textFieldShouldReturn(_ textField:UITextField) ->Bool {
        //使文本框在界面打开时就获取焦点，并弹出输入键盘
        defaultStand.set(textField1.text, forKey: FormInfo().userName)
        defaultStand.set(textField2.text, forKey: FormInfo().cardNumber)
        defaultStand.set(textField3.text, forKey: FormInfo().transferAmo)
        defaultStand.set(textField4.text, forKey: FormInfo().messgeInfo)
        defaultStand.set(textField5.text, forKey: FormInfo().remark)
        return true
    }
    @objc func handleTap(sender: UITapGestureRecognizer) {
        if sender.state == .ended {
            print("收回键盘")
            textField1.resignFirstResponder()
            textField2.resignFirstResponder()
            textField3.resignFirstResponder()
            textField4.resignFirstResponder()
            textField5.resignFirstResponder()
            textField5.resignFirstResponder()
        }
        sender.cancelsTouchesInView = false
    }


}
