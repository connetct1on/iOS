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
        setupNavigationItem()
        
    }
}
extension SetVC {
    private func setupNavigationItem() {
        navigationItem.title = "설정"
        navigationController?.navigationBar.titleTextAttributes = [. foregroundColor: UIColor.white]
    }
}
