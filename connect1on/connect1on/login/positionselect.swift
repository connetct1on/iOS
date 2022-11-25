//
//  positionselect.swift
//  connect1on
//
//  Created by 최시훈 on 2022/11/19.
//

import Foundation
import UIKit
import SnapKit
import Then

class SltpstVC: UIViewController {
    let stuSignUpButton = UIButton().then {
        $0.backgroundColor = UIColor(red: 10.0/255, green:0.0/255, blue:114.0/255, alpha: 1)
        $0.setTitle("재학생 회원가입", for: .normal)
        $0.layer.cornerRadius = 20
        $0.addTarget(self, action: #selector(TabsigninBt), for: .touchUpInside)
    }

    @objc func TabsigninBt() {

        print("//")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        view.backgroundColor = .systemBackground
        self.navigationController?.navigationBar.tintColor = .black
        setup()
    }
    private func setupNavigationBar() {
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.backgroundColor = .systemBackground
        navigationController?.navigationBar.standardAppearance = navigationBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navigationBarAppearance
        
    }
    
    
    
    func setup() {
        [
            stuSignUpButton
        ].forEach{ self.view.addSubview($0)
        }
        stuSignUpButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(200)
            $0.bottom.equalToSuperview().offset(-475)
            $0.left.equalToSuperview().offset(25)
            $0.right.equalToSuperview().offset(-145)
        }
    }
}
