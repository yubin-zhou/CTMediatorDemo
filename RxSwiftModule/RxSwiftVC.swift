//
//  RxSwiftVC.swift
//  CTMediatorDemo
//
//  Created by zhouyubin on 2023/8/24.
//

import UIKit
import RxSwift
import RxCocoa
class RxSwiftVC: UIViewController {
    fileprivate var bag:DisposeBag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        self.title = "RxSwift"
        // Do any additional setup after loading the view.
        let btn:UIButton = UIButton.init(frame: CGRect.init(x: 20, y: 100, width: 100, height: 30))
        btn.setTitleColor(.red, for: .normal)
        btn.setTitle("MVVM", for:.normal)
        self.view.addSubview(btn)
        let a:Disposable = btn.rx.tap.subscribe { event in
            print(event)
            let vc = MVVMViewController();
            self.navigationController?.pushViewController(vc, animated: true)
        }
        a.disposed(by: bag)
        
        
        
    }
    
    


}
