//
//  ProfileVC.swift
//  connect1on
//
//  Created by 최시훈 on 2022/11/17.
//

import UIKit
import SnapKit
import Then

class ProfileVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        view.backgroundColor = .systemBackground
        setupNavigationBarItem()
        self.navigationController?.navigationBar.tintColor = .white
        
    }
}
extension ProfileVC {
    
    private func setupNavigationBar() {
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.backgroundColor = UIColor(red: 10.0/255, green:0.0/255, blue:114.0/255, alpha: 1)
        navigationController?.navigationBar.standardAppearance = navigationBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navigationBarAppearance
        
    }
    

private func setupNavigationBarItem() {
    let setButton = UIBarButtonItem(
        image: UIImage(systemName: "gearshape.fill"),
        style: .plain,
        target: self,
        action: #selector(didTabSetButton))
    navigationItem.rightBarButtonItem = setButton
    
}
    @objc func didTabSetButton() {
        print("didTabSetButton")
        let VC = SetVC()
        VC.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(VC, animated: true)
        
    }
}
