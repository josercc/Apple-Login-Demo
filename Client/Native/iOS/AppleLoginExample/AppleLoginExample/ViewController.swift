//
//  ViewController.swift
//  AppleLoginExample
//
//  Created by 张行 on 2019/9/20.
//  Copyright © 2019 张行. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        /// 如果没有登录 就弹出登录界面
        if !UserManager.manager().isLogin {
            guard  let loginController = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController else {
                return
            }
            self.present(loginController, animated: true, completion: nil)
        }
    }
    
}

