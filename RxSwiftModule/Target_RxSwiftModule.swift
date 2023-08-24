//
//  Target_RxSwiftModule.swift
//  CTMediatorDemo
//
//  Created by zhouyubin on 2023/8/24.
//

import UIKit
import CTMediator
class Target_RxSwiftModule: NSObject {
    @objc func Action_RxSwiftModule_RxSwiftVC(_ parma : [AnyHashable : Any]) -> UIViewController{
        let msg = RxSwiftVC.init()
        if let callback = parma["callback"] as? (String) -> Void  {
            callback("Action_RxSwiftModule_RxSwiftVC")
        }
        return msg
    }
}
public extension CTMediator{
    func RxSwift_RxSwiftModuleVC(para: [AnyHashable : Any], callback:@escaping (String) -> Void) -> UIViewController{
        ///中间件是swift类型时必须添加 kCTMediatorParamsKeySwiftTargetModuleName 参数，value为中间类所在的组件名称，中间类是oc类型不加。 如果没有添加这个参数，那么在Mediator中无法找到目标类。
    
            var tempParma = [
                kCTMediatorParamsKeySwiftTargetModuleName:"CTMediatorDemo"
                ] as [AnyHashable : Any]
            tempParma.merge(para) { (key, vaule) -> Any in
                return key
            }
            tempParma.updateValue(callback, forKey: "callback")
            let vc = self.performTarget("RxSwiftModule", action: "RxSwiftModule_RxSwiftVC", params: tempParma, shouldCacheTarget: false) as? UIViewController ?? UIViewController.init()
            return vc
        }
    
}
