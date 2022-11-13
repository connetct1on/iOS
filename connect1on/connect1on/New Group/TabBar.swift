//
//  TabBar.swift
//  connect1on
//
//  Created by 최시훈 on 2022/11/13.
//

import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        self.tabBar.backgroundColor = UIColor(red: 48.0 / 255, green: 4.0 / 255, blue: 69.0 / 255, alpha: 1)
        self.tabBar.tintColor = .white
        self.tabBar.unselectedItemTintColor = .lightGray
        let homeTabBar = UINavigationController(rootViewController: HomeVC())
        homeTabBar.tabBarItem.title = "홈화면"
        homeTabBar.tabBarItem.image = UIImage(systemName: "house")
        
        let sarchTabBar = UIViewController()
        sarchTabBar.tabBarItem.title = "검색"
        sarchTabBar.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        
        let bestTabBar = UIViewController()
        bestTabBar.tabBarItem.title = "주간 베스트"
        bestTabBar.tabBarItem.image = UIImage(systemName: "bookmark")
        
        let profileTabBar = UIViewController()
        profileTabBar.tabBarItem.title = "프로필"
        profileTabBar.tabBarItem.image = UIImage(systemName: "person.circle")
        
        viewControllers = [homeTabBar, sarchTabBar, bestTabBar, profileTabBar]
    }
    
}
