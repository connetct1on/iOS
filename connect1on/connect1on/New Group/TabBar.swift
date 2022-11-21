//
//  TabBar.swift
//  connect1on
//
//  Created by 최시훈 on 2022/11/13.
//

import UIKit

class TabBarViewController: UITabBarController {
    let TabBarVC = TabBarViewController()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        TabBarVC.modalPresentationStyle = .fullScreen
        
        self.present(TabBarVC, animated: true, completion: nil)
        self.tabBar.backgroundColor = UIColor(red: 10.0 / 255, green: 0.0 / 255, blue: 114.0 / 255, alpha: 1)
        self.tabBar.tintColor = .white
        self.tabBar.unselectedItemTintColor = .lightGray
        let homeTabBar = UINavigationController(rootViewController: HomeVC())
        homeTabBar.tabBarItem.title = ""
        homeTabBar.tabBarItem.image = UIImage(systemName: "house")
        
        let sarchTabBar = UIViewController()
        sarchTabBar.tabBarItem.title = ""
        sarchTabBar.tabBarItem.image = UIImage(systemName: "questionmark")
        
        let bestTabBar = UIViewController()
        bestTabBar.tabBarItem.title = ""
        bestTabBar.tabBarItem.image = UIImage(systemName: "person.2")
        
        let profileTabBar = UIViewController()
        profileTabBar.tabBarItem.title = ""
        profileTabBar.tabBarItem.image = UIImage(systemName: "person")
        
        viewControllers = [homeTabBar, sarchTabBar, bestTabBar, profileTabBar]
    }
    
}
