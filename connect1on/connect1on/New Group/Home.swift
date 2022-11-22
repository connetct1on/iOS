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
    }
    func setupNavigationBar() {
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.backgroundColor = .systemBackground
        navigationController?.navigationBar.standardAppearance = navigationBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navigationBarAppearance
//        @objc func buttonPressed() {
//            print("검색")
//        }
    }
}
