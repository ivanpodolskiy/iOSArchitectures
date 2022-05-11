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
        let vc1 = SearchModulBuilder.biuld()
        vc1.navigationItem.title = "Search via iTunes"
        let navigationViewControllerFirst = self.configuredNavigationController(rootController: vc1)
        
        let vc2 = SearchSongModulBuilder.build()
        vc2.navigationItem.title = "Search view Music"
        let navigationControllerSecond = self.configuredNavigationController(rootController: vc2)
        
        navigationViewControllerFirst.title = "Store"
        navigationControllerSecond.title = "Music"
        
        let tabBarController = UITabBarController()
        tabBarController.tabBar.tintColor = .systemRed
        tabBarController.setViewControllers([navigationViewControllerFirst, navigationControllerSecond], animated: true)
        
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
    
    private func configuredNavigationController(rootController: UIViewController) ->UINavigationController {
        let navVC = UINavigationController.init(rootViewController: rootController)
        navVC.navigationBar.barTintColor = UIColor.varna
        navVC.navigationBar.isTranslucent = false
        navVC.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navVC.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        return navVC
    }
}
