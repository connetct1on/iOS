//
//  Home.swift
//  connect1on
//
//  Created by 최시훈 on 2022/11/13.
//

import Foundation
import UIKit
import Then
import SnapKit

class HomeVC: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupNavigationBarItem()
        self.navigationController?.navigationBar.tintColor = .black
    }
    func setupNavigationBar() {
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.backgroundColor = .systemBackground
        navigationController?.navigationBar.standardAppearance = navigationBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navigationBarAppearance
    }
   
        func setupNavigationBarItem() {
            
            let massageButton = UIBarButtonItem(
                image: UIImage(systemName: "paperplane"),
                style: .plain,
                target: self,
                action: #selector(didTabMassageButton)
            )
            
            navigationItem.rightBarButtonItem = massageButton
        }
    @objc func didTabMassageButton() {
        let VC = MassageVC()
        present(VC, animated: true, completion: nil)
        UIView.animate(withDuration: 0.3) {
            self.view.window?.rootViewController = MassageVC()
        }
    }
}
