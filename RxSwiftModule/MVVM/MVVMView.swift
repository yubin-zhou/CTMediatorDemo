//
//  MVVMView.swift
//  CTMediatorDemo
//
//  Created by zhouyubin on 2023/8/28.
//

import UIKit

class MVVMView: UIView {
    var viewModel:MVVMViewModel? = nil
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.frame = frame
        initUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func initUI(){
        self.addSubview(self.nameTextFiled)
        self.addSubview(self.pwdTextFiled)
        self.addSubview(self.nameLab)
        self.addSubview(self.pwdLab)
        self.addSubview(self.updataUserNmaeBtn)
        self.addSubview(self.updataPwdBtn)
        bindViewModel()
    }
    ///
    func setWithViewModel(viewModel:MVVMViewModel){
        self.viewModel = viewModel
        observeViewModel()
        
    }
    func bindViewModel(){
        self.nameTextFiled.addTarget(self, action: #selector(nameTextFieldDidChange(_ :)), for: .editingChanged)
        self.pwdTextFiled.addTarget(self, action: #selector(pwdTextFieldDidChange(_ :)), for: .editingChanged)
    }
    func observeViewModel(){
        self.viewModel?.userModel.addObserver(self, forKeyPath: "name",options: [.new], context: nil)
        self.viewModel?.userModel.addObserver(self, forKeyPath: "pwd",context: nil)
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        print(keyPath ?? "")
     
        switch keyPath{
        case "name":
            let model:MVVMModel = object as! MVVMModel
            self.nameTextFiled.text = model.name
            self.nameLab.text = model.name
            break
        case "pwd":
            let model:MVVMModel = object as! MVVMModel
            self.pwdTextFiled.text = model.pwd
            self.pwdLab.text =  model.pwd
            break
        default:
            break
        }
    }
   
   
    @objc func nameTextFieldDidChange(_ texField:UITextField){
        viewModel?.userModel.name = texField.text ?? ""
        nameLab.text = viewModel?.userModel.name
    }
    @objc func pwdTextFieldDidChange(_ texField:UITextField){
        viewModel?.userModel.pwd =  texField.text ?? ""
        pwdLab.text = viewModel?.userModel.pwd
    }
    @objc func updateUserName(btn: UIButton){
        self.viewModel?.updateUserName()
     
    }
    @objc func updatePwd(btn: UIButton){
       self.viewModel?.updateUserPwd()
    }
    
    deinit{
        print("deinit")
        self.viewModel?.userModel.removeObserver(self, forKeyPath: "name")
        self.viewModel?.userModel.removeObserver(self, forKeyPath: "pwd")
    }
    
    lazy var nameTextFiled:UITextField = {
        let nameTF:UITextField = UITextField.init(frame: CGRect(x: 20, y: 100, width: self.frame.size.width-40, height: 40))

        nameTF.placeholder = "请输入用户名"
        return nameTF
    }()
    lazy var pwdTextFiled:UITextField = {
        let nameTF:UITextField = UITextField.init(frame: CGRect(x: 20, y: CGRectGetMaxY(self.nameTextFiled.frame)+20, width: self.frame.size.width-40, height: 40))

        nameTF.placeholder = "请输入密码"
        return nameTF
    }()
    
    lazy var nameLab:UILabel = {
        let lab:UILabel = UILabel.init(frame: CGRect(x: 20, y: CGRectGetMaxY(self.pwdTextFiled.frame)+20, width: self.frame.size.width-40, height: 40))
        lab.backgroundColor = .lightGray
        return lab
    }()
    lazy var pwdLab:UILabel = {
        let lab:UILabel = UILabel.init(frame: CGRect(x: 20, y: CGRectGetMaxY(self.nameLab.frame)+20, width: self.frame.size.width-40, height: 40))
        lab.backgroundColor = .lightGray
        return lab
    }()
    lazy var updataUserNmaeBtn:UIButton = {
        let btn:UIButton = UIButton.init(frame: CGRect(x: 20, y: CGRectGetMaxY(self.pwdLab.frame)+20, width: self.frame.size.width-40, height: 40))
        btn.setTitle("更新用户名", for:.normal)
        btn.setTitleColor(.red, for: .normal)
        btn.addTarget(self, action: #selector(updateUserName(btn: )), for: .touchUpInside)
        return btn
    }()
    lazy var updataPwdBtn:UIButton = {
        let btn:UIButton = UIButton.init(frame: CGRect(x: 20, y: CGRectGetMaxY(self.updataUserNmaeBtn.frame)+20, width: self.frame.size.width-40, height: 40))
        btn.setTitle("更新密码", for:.normal)
        btn.setTitleColor(.red, for: .normal)
        btn.addTarget(self, action: #selector(updatePwd(btn: )), for: .touchUpInside)
        return btn
    }()
    
}

