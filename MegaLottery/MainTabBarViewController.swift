//
//  MainTabBarViewController.swift
//  MegaLottery
//
//  Created by Zhanserik on 11/6/16.
//  Copyright © 2016 Kenes Inc. All rights reserved.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewControllers = [
            UINavigationController(rootViewController: EventsViewController()),
            UINavigationController(rootViewController: ProfileViewController())
        ]
        
        setupTabBars()
    }
    
    func setupTabBars() {
        let imageList = ["present", "profile"]
        let titleList = ["Events", "Profile"]
        let itemList = tabBar.items
        
        guard let items = itemList else {
            return
        }
        for (idx, value) in items.enumerated() {
            let title = titleList[idx]
            let imageName = imageList[idx]
            value.title = title
            value.image = UIImage(named: imageName)
        }
    }

}
