//
//  ViewController.swift
//  MegaLottery
//
//  Created by Zhanserik on 11/6/16.
//  Copyright © 2016 Kenes Inc. All rights reserved.
//

import UIKit
import EasyPeasy
import Typist
import FBSDKCoreKit
import AccountKit

class ViewController: UIViewController {
    
    lazy var accountKit: AKFAccountKit = {
        let accountKit = AKFAccountKit(responseType: .authorizationCode)
        return accountKit
    }()
    lazy var pendingLoginController: UIViewController? = {
        return self.accountKit.viewControllerForLoginResume()
    }()
    
    var authorizationCode: String = ""
    
    private lazy var logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named:"Halyk_Bank")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.avenirUltraLight(fontSize: 24)
        label.textAlignment = .center
        label.textColor = .darkText
        label.numberOfLines = 0
        label.text = "WELCOME \n AGENT"
        return label
    }()
    
    private lazy var submitButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.appColor
        button.setTitle("SIGN IN", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 25
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(submit), for: .touchUpInside)
        return button
    }()
    
    private func setupViews(){
        view.backgroundColor = UIColor.cloudColor
        
        [titleLabel,
         
         submitButton,
         logoImageView
            ].forEach{
                view.addSubview($0)
        }
        
    }
    
    private func setupConstraints(){
        
        logoImageView <- [
            Height(100),
            Width(210),
            Top(100),
            CenterX(0)
        ]
        
        titleLabel <- [
            Left(10),
            Right(10),
            Top(10).to(logoImageView)
        ]
        
        submitButton <- [
            Top(10).to(titleLabel),
            Width(300),
            Height(50),
            CenterX(0)
        ]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
        configureKeyboard()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let token = accountKit.currentAccessToken {
            
        }
        else if let loginViewController = pendingLoginController as? AKFViewController {
            loginViewController.delegate = self
            loginViewController.theme = AKFTheme(primaryColor: UIColor.appColor, primaryTextColor: UIColor.darkText, secondaryColor: UIColor.cloudColor, secondaryTextColor: UIColor.lightText, statusBarStyle: .default)
        }
    }
    
    func configureKeyboard() {
            
    }
    
    func submit(){
        let viewController = self.accountKit.viewControllerForPhoneLogin(with: nil, state: UUID().uuidString) as! AKFViewController
        viewController.enableSendToFacebook = true
        self.present(viewController as! UIViewController, animated: true, completion: nil)
    }
    
    func proceedToMainScreen() {
        let controller = MainTabBarViewController()
        self.present(controller, animated: true, completion: nil)
    }
    
    
}
extension ViewController: AKFViewControllerDelegate {
    
    func viewController(_ viewController: UIViewController!, didCompleteLoginWithAuthorizationCode code: String!, state: String!) {
        self.proceedToMainScreen()
    }
    func viewController(_ viewController: UIViewController!, didCompleteLoginWith accessToken: AKFAccessToken!, state: String!){
        self.proceedToMainScreen()
    }
    func viewController(_ viewController: UIViewController!, didFailWithError error: Error!){
        
    }
    func viewControllerDidCancel(_ viewController: UIViewController!) {
        
    }
    
}

