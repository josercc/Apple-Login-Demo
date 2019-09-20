//
//  LoginViewController.swift
//  AppleLoginExample
//
//  Created by 张行 on 2019/9/20.
//  Copyright © 2019 张行. All rights reserved.
//

import UIKit
import SnapKit
import AuthenticationServices

class LoginViewController: UIViewController, ASAuthorizationControllerDelegate, ASAuthorizationControllerPresentationContextProviding {

    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        if #available(iOS 13.0, *) {
            let appleLoginButton = ASAuthorizationAppleIDButton(authorizationButtonType: .default, authorizationButtonStyle: .white)
            appleLoginButton.addTarget(self, action: #selector(self.appleLoginClick), for: UIControl.Event.touchUpInside)
            self.view.addSubview(appleLoginButton)
            appleLoginButton.snp.makeConstraints { (maker) in
                maker.leading.trailing.equalTo(self.signUpButton)
                maker.top.equalTo(self.signUpButton.snp.bottom).offset(30)
                maker.height.equalTo(49)
            }
        }
    }
    @IBAction func signIn(_ sender: Any) {
        
    }
    @IBAction func signUp(_ sender: Any) {
        
    }
    
    @objc func appleLoginClick() {
        let appleIDProvider = ASAuthorizationAppleIDProvider()
        let appleIDRequest = appleIDProvider.createRequest()
        appleIDRequest.requestedScopes = [.email,.fullName]
        
        let appleLoginController = ASAuthorizationController(authorizationRequests: [appleIDRequest])
        appleLoginController.delegate = self
        appleLoginController.presentationContextProvider = self
        appleLoginController.performRequests()
    }
    
    /// MARK:ASAuthorizationControllerDelegate
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        
    }
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        
    }
    
    /// MARK: ASAuthorizationControllerPresentationContextProviding
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return self.view.window!
    }
    
}
