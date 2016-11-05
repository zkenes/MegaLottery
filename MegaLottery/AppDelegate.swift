//
//  AppDelegate.swift
//  MegaLottery
//
//  Created by Zhanserik on 11/6/16.
//  Copyright © 2016 Kenes Inc. All rights reserved.
//

import UIKit
import CoreData
import FBSDKCoreKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        FBSDKApplicationDelegate.sharedInstance().application(application, didFinishLaunchingWithOptions: launchOptions)
        
        loadMainPage()
        
        return true
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        
        let handled = FBSDKApplicationDelegate.sharedInstance().application(app, open: url, sourceApplication: options[.sourceApplication] as! String!, annotation: options[.annotation])
        return handled
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        FBSDKAppEvents.activateApp()
    }
    
    func loadMainPage(){
        window = UIWindow()
        window?.makeKeyAndVisible()
        window?.backgroundColor = .white
        self.window?.rootViewController = MainTabBarViewController()
    }
    func loadLoginPage(){
        window = UIWindow()
        window?.makeKeyAndVisible()
        window?.backgroundColor = .white
        self.window?.rootViewController = ViewController()
    }
}

