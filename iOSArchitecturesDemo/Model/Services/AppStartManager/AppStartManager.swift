//
//  AppStartConfigurator.swift
//  iOSArchitecturesDemo
//
//  Created by ekireev on 19.02.2018.
//  Copyright © 2018 ekireev. All rights reserved.
//

import UIKit

final class AppStartManager {
    
    var window: UIWindow?
    
    init(window: UIWindow?) {
        self.window = window
    }
    
    func start() {
        let rootVC = SearchModulBuilder.biuld()
        rootVC.navigationItem.title = "Search via iTunes"
        let navVC = self.configuredNavigationController
        navVC.viewControllers = [rootVC]
        
        let vc2 = SearchSongModulBuilder.build()
        navVC.title = "Store"
        vc2.title = "Music"
        
        let tabBarController = UITabBarController()
        tabBarController.setViewControllers([navVC, vc2], animated: true)
        
        guard let items = tabBarController.tabBar.items else {
            return
        }
        let images = ["cart", "music.note"]
        
        for i in 0...1 {
            if #available(iOS 13.0, *) {
                items[i].image = UIImage(systemName: images[i])
            }
            window?.rootViewController = tabBarController
            window?.makeKeyAndVisible()
        }
    }
    
    private lazy var configuredNavigationController: UINavigationController = {
        let navVC = UINavigationController()
        navVC.navigationBar.barTintColor = UIColor.varna
        navVC.navigationBar.isTranslucent = false
        navVC.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navVC.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        return navVC
    }()
}
