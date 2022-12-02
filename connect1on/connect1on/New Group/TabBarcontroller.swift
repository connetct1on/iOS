//
//  TabBar.swift
//  connect1on
//
//  Created by 최시훈 on 2022/11/13.
//

import UIKit

class TabBarcontroller: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        self.tabBar.backgroundColor = UIColor(red: 10.0 / 255, green: 0.0 / 255, blue: 114.0 / 255, alpha: 1)
        self.tabBar.tintColor = .white
        self.tabBar.unselectedItemTintColor = .lightGray
        
        
        let sarchTabBar = UIViewController()
        sarchTabBar.tabBarItem.title = ""
        sarchTabBar.tabBarItem.image = UIImage(systemName: "questionmark")
        let homeTabBar = UINavigationController(rootViewController: HomeVC())
        homeTabBar.tabBarItem.title = ""
        homeTabBar.tabBarItem.image = UIImage(systemName: "house")
        let profileTabBar = UIViewController()
        profileTabBar.tabBarItem.title = ""
        profileTabBar.tabBarItem.image = UIImage(systemName: "person")
        
        viewControllers = [sarchTabBar, homeTabBar, profileTabBar]
    }
    
}
