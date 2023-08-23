//
//  CTMediator+Login.swift
//  CTMediatorDemo
//
//  Created by zhouyubin on 2023/8/22.
//

import Foundation
import CTMediator

public extension CTMediator{
    func login_LoginVC(para: [AnyHashable : Any], callback:@escaping (String) -> Void) -> UIViewController{
        ///中间件是swift类型时必须添加 kCTMediatorParamsKeySwiftTargetModuleName 参数，value为中间类所在的组件名称，中间类是oc类型不加。 如果没有添加这个参数，那么在Mediator中无法找到目标类。
    
            var tempParma = [
                kCTMediatorParamsKeySwiftTargetModuleName:"CTMediatorDemo"
                ] as [AnyHashable : Any]
            tempParma.merge(para) { (key, vaule) -> Any in
                return key
            }
            tempParma.updateValue(callback, forKey: "callback")
        ///self.performTarget("Login", action:.... Login 代表着 Target_xxx 中的xxx 这个名字一定要相同
        ///。。。。action: "Login_LoginVC", Login_LoginVC代表着方法名，
            let vc = self.performTarget("Login", action: "Login_LoginVC", params: tempParma, shouldCacheTarget: false) as? UIViewController ?? UIViewController.init()
            return vc
        }
}
