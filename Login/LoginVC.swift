//
//  LoginVC.swift
//  CTMediatorDemo
//
//  Created by zhouyubin on 2023/8/21.
//

import UIKit
import CTMediator
class LoginVC: UIViewController {
    var userinfo:Any?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Login"
        self.view.backgroundColor = .white
//        print(userinfo)
        let btn = UIButton.init(frame: CGRect(x: 40, y: 100, width: 100, height: 30))
        btn.setTitle("登录", for: .normal)
        btn.setTitleColor(.red, for: .normal)
        btn.addTarget(self, action: #selector(loginAction), for: .touchUpInside)
        self.view.addSubview(btn)
    }
    
  @objc func loginAction(){
        let vc = CTMediator.sharedInstance().message_MessageVC(para: [:]) { temp in
            print(temp)
        }
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
