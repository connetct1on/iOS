//
//  SetVC.swift
//  connect1on
//
//  Created by 최시훈 on 2022/12/01.
//

import UIKit
class SetVC: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        self.navigationController?.navigationBar.tintColor = .white
        
    }
    private func Navigationbarsetup() {
        let navigationBar = UINavigationBarAppearance()
        navigationBar.backgroundColor = UIColor(red: 0.0/255, green:0.0/255, blue:0.0/255, alpha: 1)
        navigationController?.navigationBar.standardAppearance = navigationBar
        navigationController?.navigationBar.scrollEdgeAppearance = navigationBar

    }
    
    
}
