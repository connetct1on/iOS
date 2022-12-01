//
//  HomeVC.swift
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
        view.backgroundColor = .systemBackground
        setupNavigationBarItem()
        self.navigationController?.navigationBar.tintColor = .white
    }
    
    private func setupNavigationBar() {
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.backgroundColor = UIColor(red: 10.0/255, green:0.0/255, blue:114.0/255, alpha: 1)
        navigationController?.navigationBar.standardAppearance = navigationBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navigationBarAppearance

    }
    
    private func setupNavigationBarItem() {
        
        let massageButton = UIBarButtonItem(
            image: UIImage(systemName: "paperplane"),
            style: .plain,
            target: self,
            action: #selector(didTabMassageButton)
        )
        //navigationItem.title = "navigationBarTitle"
        navigationItem.rightBarButtonItem = massageButton
    }
    @objc func didTabMassageButton() {
        let VC = MassageVC()
        VC.modalPresentationStyle = .fullScreen
        present(VC, animated: true, completion: nil)
        
        }
    }
