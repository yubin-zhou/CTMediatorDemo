//
//  Target_Login.swift
//  CTMediatorDemo
//
//  Created by zhouyubin on 2023/8/21.
//

import UIKit

// 该类一定是以 Action_xxx 开头的
//  该类的 xxx 可以随意取名字 你想叫什么就叫什么，通常情况下，我们用模块名作为xxx
class Target_Login: NSObject {

    @objc func Action_Login_LoginVC(_ parma : [AnyHashable : Any]) -> UIViewController{
        let login = LoginVC.init()
        if let callback = parma["callback"] as? (String) -> Void  {
            callback("返回Action_Login_LoginVC")
        }
        login.userinfo = parma
        return login
    }
    
}
