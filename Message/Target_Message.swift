//
//  Target_Message.swift
//  CTMediatorDemo
//
//  Created by zhouyubin on 2023/8/23.
//

import UIKit
import CTMediator
class Target_Message: NSObject {
    @objc func Action_Message_MessageVC(_ parma : [AnyHashable : Any]) -> UIViewController{
        let msg = MessageVC.init()
        if let callback = parma["callback"] as? (String) -> Void  {
            callback("返回Action_Message_MessageVC")
        }
        msg.data = parma
        return msg
    }
}
public extension CTMediator{
    func message_MessageVC(para: [AnyHashable : Any], callback:@escaping (String) -> Void) -> UIViewController{
        ///中间件是swift类型时必须添加 kCTMediatorParamsKeySwiftTargetModuleName 参数，value为中间类所在的组件名称，中间类是oc类型不加。 如果没有添加这个参数，那么在Mediator中无法找到目标类。
    
            var tempParma = [
                kCTMediatorParamsKeySwiftTargetModuleName:"CTMediatorDemo"
                ] as [AnyHashable : Any]
            tempParma.merge(para) { (key, vaule) -> Any in
                return key
            }
            tempParma.updateValue(callback, forKey: "callback")
            let vc = self.performTarget("Message", action: "Message_MessageVC", params: tempParma, shouldCacheTarget: false) as? UIViewController ?? UIViewController.init()
            return vc
        }
    
}
