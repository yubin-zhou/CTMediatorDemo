//
//  MVVMViewModel.swift
//  CTMediatorDemo
//
//  Created by zhouyubin on 2023/8/25.
//

import UIKit

class MVVMViewModel: NSObject {
  @objc dynamic var userModel:MVVMModel = MVVMModel()
    
    func updateUserName(){
        userModel.name = "周玉彬"
    }
    func updateUserPwd(){
        userModel.pwd = "1234560000###"
    }
    
}
