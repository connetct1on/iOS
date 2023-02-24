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
    
    let homePageBt = UIButton().then {
        $0.setImage(UIImage(named: "dgsw_logo"), for: .normal)
        $0.backgroundColor = .mainColor
        $0.contentVerticalAlignment = .fill
        $0.contentHorizontalAlignment = .fill
        $0.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        $0.addTarget(HomeVC.self, action: #selector(didTabLogoBt), for: .touchUpInside)
    }
    let schoolFacilitiesBt = UIButton().then {
        $0.setImage(UIImage(named: "playground"), for: .normal)
        $0.backgroundColor = .mainColor
        $0.layer.cornerRadius = 25
        $0.contentVerticalAlignment = .fill
        $0.contentHorizontalAlignment = .fill
        $0.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        $0.addTarget(HomeVC.self, action: #selector(didTabFacilitiesBt), for: .touchUpInside)
    }
    let schoolEventBt = UIButton().then {
        $0.setImage(UIImage(named: "playground"), for: .normal)
        $0.backgroundColor = .mainColor
        $0.layer.cornerRadius = 25
        $0.contentVerticalAlignment = .fill
        $0.contentHorizontalAlignment = .fill
        $0.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        $0.addTarget(HomeVC.self, action: #selector(didTabEventBt), for: .touchUpInside)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupNavigationBar()
        view.backgroundColor = .systemBackground
        setupNavigationBarItem()
        self.navigationController?.navigationBar.tintColor = .white
    }
}
extension HomeVC {
    @objc func didTabLogoBt() {
        let url = URL(string: "https://www.dgsw.hs.kr")
        UIApplication.shared.open(url!, options: [:] )
    }
    @objc func didTabMessageButton() {
        let VC = ChannelVC()
        VC.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(VC, animated: true)
    }
    @objc func didTabFacilitiesBt() {
        let VC = FacilitiesVC()
        let navigationController = UINavigationController(rootViewController: VC)
        present(navigationController, animated: true, completion: nil)
    }
    @objc func didTabEventBt() {
        let VC = EventVC()
        let navigationController = UINavigationController(rootViewController: VC)
        present(navigationController, animated: true, completion: nil)
    }
    func setupNavigationBar() {
        let navigationBar = UINavigationBarAppearance()
        navigationBar.backgroundColor = .mainColor; navigationController?.navigationBar.standardAppearance = navigationBar
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
    
    func setup() {
        [
            homePageBt, schoolFacilitiesBt, schoolEventBt
        ].forEach{ self.view.addSubview($0) }
        homePageBt.snp.makeConstraints {
            $0.top.equalToSuperview().offset(100)
            $0.bottom.equalToSuperview().offset(-670)
            $0.left.equalToSuperview().offset(40)
            $0.right.equalToSuperview().offset(-40)
        }
        schoolFacilitiesBt.snp.makeConstraints {
            $0.top.equalTo(homePageBt.snp.bottom).offset(50)
            $0.bottom.equalTo(homePageBt.snp.bottom).offset(230)
            $0.left.equalToSuperview().offset(40)
            $0.right.equalToSuperview().offset(-40)
        }
        schoolEventBt.snp.makeConstraints {
            $0.top.equalTo(homePageBt.snp.bottom).offset(280)
            $0.bottom.equalTo(homePageBt.snp.bottom).offset(460)
            $0.left.equalToSuperview().offset(40)
            $0.right.equalToSuperview().offset(-40)
        }
    }
}

