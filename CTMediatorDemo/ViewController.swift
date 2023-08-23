//
//  ViewController.swift
//  CTMediatorDemo
//
//  Created by zhouyubin on 2023/8/21.
//

import UIKit
import CTMediator
class ViewController: UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.baseTableView.frame = self.view.frame
        self.title = "Home"
        self.view.addSubview(self.baseTableView)
    }
    
    
    lazy var baseTableView: UITableView = {
        let tableView = UITableView(frame: CGRect.zero, style: UITableView.Style.plain)
        tableView.dataSource = self;
        tableView.delegate = self
        tableView.backgroundColor = UIColor.white
        tableView.separatorColor = UIColor.clear
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        tableView.tableFooterView = UIView()
        tableView.separatorStyle = .none
        if #available(iOS 15.0, *){
            tableView.sectionHeaderTopPadding = 0
        }
        return tableView
    }()


}

extension ViewController:UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if(indexPath.row == 0){
            let vc = CTMediator.sharedInstance().login_LoginVC(para: ["name":"周周","id":6278]) { temp in
                print("resut:=====\(temp)")
            }
            self.navigationController?.pushViewController(vc, animated: true)
        }
        if(indexPath.row==1){
            let vc = CTMediator.sharedInstance().message_MessageVC(para: ["消息":"1213213"]) { temp in
                print("resut:=====\(temp)")
            }
            self.navigationController?.pushViewController(vc, animated: true)
        }
        print(indexPath.row)
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell  = UITableViewCell.init(frame: CGRect.init(x: 0, y: 0, width: self.view.frame.size.width, height: 30))
        cell.textLabel?.text = "行号：\(indexPath.row)"
        return cell
    }
    
}

