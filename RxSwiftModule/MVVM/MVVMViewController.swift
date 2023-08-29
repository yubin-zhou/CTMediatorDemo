//
//  MVVMViewController.swift
//  CTMediatorDemo
//
//  Created by zhouyubin on 2023/8/25.
//

import UIKit

class MVVMViewController: UIViewController {
    var viewModel:MVVMViewModel = MVVMViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "MVVM"
        self.view.backgroundColor = .white
        self.initUI()
    }
    
    func initUI(){
        let view:MVVMView = MVVMView.init(frame: self.view.frame)
        self.view.addSubview(view)
        view.setWithViewModel(viewModel: viewModel)
    }

 
    
  

}


