//
//  SignOnUIViewController.swift
//  SmartQ
//
//  Created by Roy on 2019/7/24.
//  Copyright © 2019 tiny. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class SignOnController: UIViewController, UITextFieldDelegate {
    
    var txtUser: UITextField! //用户名输入框
    var txtPwd: UITextField! //密码输入款
    var formView: UIView! //登陆框视图
    var horizontalLine: UIView! //分隔线
    var confirmButton:UIButton! //登录按钮

    
    var topConstraint: Constraint? //登录框距顶部距离约束
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //header
        let signonHeaderView = UIImageView(image:UIImage(named:"signonHeader"))
        signonHeaderView.frame = CGRect(x:0, y:22, width:self.view.frame.width,height:44)
        self.view.addSubview(signonHeaderView)
        //footer
        let signonBodyView = UIImageView(image:UIImage(named:"signonBody"))
        signonBodyView.frame = CGRect(x:0, y:250, width:self.view.frame.width,height:self.view.frame.height - 250)
        self.view.addSubview(signonBodyView)
        //视图背景色
        self.view.backgroundColor = UIColor(red: 0/255, green: 53/255, blue: 98/255,
                                            alpha: 1)
        
        //登录框高度
        let formViewHeight = 90
        //登录框背景
        self.formView = UIView()
        self.formView.layer.borderWidth = 0.5
        self.formView.layer.borderColor = UIColor.lightGray.cgColor
        self.formView.backgroundColor = UIColor.white
        self.formView.layer.cornerRadius = 5
        self.view.addSubview(self.formView)
        //最常规的设置模式
        self.formView.snp.makeConstraints { (make) -> Void in
            make.left.equalTo(15)
            make.right.equalTo(-15)
            //存储top属性
            //            self.topConstraint = make.centerY.equalTo(self.view).constraint
            self.topConstraint = make.centerY.equalTo(self.view).constraint
            make.height.equalTo(formViewHeight)
        }
        
        //分隔线
        self.horizontalLine =  UIView()
        self.horizontalLine.backgroundColor = UIColor.lightGray
        self.formView.addSubview(self.horizontalLine)
        self.horizontalLine.snp.makeConstraints { (make) -> Void in
            make.height.equalTo(0.5)
            make.left.equalTo(15)
            make.right.equalTo(-15)
            make.centerY.equalTo(self.formView)
        }
        
        //用户名图标
        let imgLock1 =  UIImageView(frame:CGRect(x: 11, y: 11, width: 22, height: 22))
        imgLock1.image = UIImage(named:"profile")
        
        //密码图标
        let imgLock2 =  UIImageView(frame:CGRect(x: 11, y: 11, width: 22, height: 22))
        imgLock2.image = UIImage(named:"password")
        
        //用户名输入框
        self.txtUser = UITextField()
        self.txtUser.delegate = self
        self.txtUser.placeholder = "用户名"
        self.txtUser.tag = 100
        self.txtUser.leftView = UIView(frame:CGRect(x: 0, y: 0, width: 44, height: 44))
        self.txtUser.leftViewMode = UITextFieldViewMode.always
        self.txtUser.returnKeyType = UIReturnKeyType.next
        
        //用户名输入框左侧图标
        self.txtUser.leftView!.addSubview(imgLock1)
        self.formView.addSubview(self.txtUser)
        
        //布局
        self.txtUser.snp.makeConstraints { (make) -> Void in
            make.left.equalTo(15)
            make.right.equalTo(-15)
            make.height.equalTo(44)
            make.centerY.equalTo(self.formView).offset(-formViewHeight/4)
        }
        
        //密码输入框
        self.txtPwd = UITextField()
        self.txtPwd.delegate = self
        self.txtPwd.placeholder = "密码"
        self.txtPwd.tag = 101
        self.txtPwd.leftView = UIView(frame:CGRect(x: 0, y: 0, width: 44, height: 44))
        self.txtPwd.leftViewMode = UITextFieldViewMode.always
        self.txtPwd.returnKeyType = UIReturnKeyType.next
        self.txtPwd.isSecureTextEntry = true
        
        //密码输入框左侧图标
        self.txtPwd.leftView!.addSubview(imgLock2)
        self.formView.addSubview(self.txtPwd)
        
        //布局
        self.txtPwd.snp.makeConstraints { (make) -> Void in
            make.left.equalTo(15)
            make.right.equalTo(-15)
            make.height.equalTo(44)
            make.centerY.equalTo(self.formView).offset(formViewHeight/4)
        }
        
        //登录按钮
        self.confirmButton = UIButton()
        self.confirmButton.setTitle("登录", for: UIControlState())
        self.confirmButton.setTitleColor(UIColor.white,
                                         for: UIControlState())
        self.confirmButton.layer.cornerRadius = 5
        self.confirmButton.backgroundColor = UIColor(red: 0/255, green: 117/255, blue: 192/255,
                                                     alpha: 1)
        self.confirmButton.addTarget(self, action: #selector(loginConfrim),
                                     for: .touchUpInside)
        self.view.addSubview(self.confirmButton)
        self.confirmButton.snp.makeConstraints { (make) -> Void in
            make.left.equalTo(15)
            make.top.equalTo(self.formView.snp.bottom).offset(20)
            make.right.equalTo(-15)
            make.height.equalTo(44)
        }
        self.topConstraint?.update(offset: -150)

    }
    
    //输入框获取焦点开始编辑
    func textFieldDidBeginEditing(_ textField:UITextField){
        UIView.animate(withDuration: 0.5, animations: { () -> Void in
//            self.topConstraint?.update(offset: -130)
            self.view.layoutIfNeeded()
        })
    }
    
    //输入框返回时操作
    func textFieldShouldReturn(_ textField:UITextField) -> Bool{
        let tag = textField.tag
        switch tag {
        case 100:
            self.txtPwd.becomeFirstResponder()
        case 101:
            loginConfrim()
        default:
            print(textField.text!)
        }
        return true
    }
    
    //登录按钮点击
    @objc func loginConfrim(){
        //收起键盘
        self.view.endEditing(true)
        //视图约束恢复初始设置
//        UIView.animate(withDuration: 0.5, animations: { () -> Void in
//            self.topConstraint?.update(offset: 0)
//            self.view.layoutIfNeeded()
//            let vc = HomeController()
//            self.navigationController?.pushViewController(vc, animated: true)
//        })
//        let dashboard = DashBoardController()
        let baseVC = DashBoardBaseViewController()
        let menuVC = DashBoardMenuViewController()
        baseVC.menuVC = menuVC
        menuVC.baseVC = baseVC
        let contentVC = CardSummaryViewController()
        let navigationContent = DashBoardUINavigationController(rootViewController: contentVC)
        baseVC.contentVC = navigationContent
        self.present(baseVC, animated: false, completion: nil)
//        self.navigationController?.pushViewController(dashboard, animated: true)
    }
}
