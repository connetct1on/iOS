//
//  HomeVC.swift
//  connect1on
//
//  Created by 최시훈 on 2022/11/13.
//

import UIKit
import Then
import SnapKit

class HomeVC: UIViewController {

    let clubButton = UIButton().then {
        $0.setImage(UIImage(named: "dgsw_logo"), for: .normal)
        $0.backgroundColor = UIColor(red:  10.0/255, green:0.0/255, blue:114.0/255, alpha: 1)
//        $0.layer.cornerRadius = 20
        $0.contentVerticalAlignment = .fill
        $0.contentHorizontalAlignment = .fill
        $0.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        $0.addTarget(self, action: #selector(didTabLogoBt), for: .touchUpInside)
        
    }

    
    private func setupNavigationBar() {
        let navigationBar = UINavigationBarAppearance()
        navigationBar.backgroundColor = UIColor(red: 10.0/255, green:0.0/255, blue:114.0/255, alpha: 1)
        navigationController?.navigationBar.standardAppearance = navigationBar
        navigationController?.navigationBar.scrollEdgeAppearance = navigationBar

    }
    
    private func setupNavigationBarItem() {
        
        let messageButton = UIBarButtonItem(
            image: UIImage(systemName: "paperplane"),
            style: .plain,
            target: self,
            action: #selector(didTabMessageButton)
        )
        navigationItem.rightBarButtonItem = messageButton
    }
    
    @objc private func didTabMessageButton() {
        let VC = MessageTableViewVC()
        VC.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(VC, animated: true)
        
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupNavigationBar()
        view.backgroundColor = .systemBackground
        setupNavigationBarItem()
        self.navigationController?.navigationBar.tintColor = .white
    }
    @objc func didTabLogoBt() {
        print("didTabLogoBt")
    }
    
    func setup() {
            [
                clubButton
            ].forEach{ self.view.addSubview($0) }
            clubButton.snp.makeConstraints {
                $0.top.equalToSuperview().offset(100)
                $0.bottom.equalToSuperview().offset(-670)
                $0.left.equalToSuperview().offset(40)
                $0.right.equalToSuperview().offset(-40)
                
            }
        }
    
    }
