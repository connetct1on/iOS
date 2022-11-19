//
//  signup.swift
//  connect1on
//
//  Created by 최시훈 on 2022/11/17.
//

import Foundation
import UIKit
import SnapKit
import Then

class StuSignUpVC: UIViewController {
    let idTextField = UITextField().then {
        $0.placeholder = "아이디를 입력해주세요"
        $0.font = .systemFont(ofSize: 14.0, weight: .medium)
        $0.autocapitalizationType = .none
        $0.backgroundColor = UIColor(red: 220/255, green: 220/225, blue: 220/225, alpha: 1)
        $0.layer.cornerRadius = 25
    }
    let pwTextField = UITextField().then {
        $0.placeholder = "비밀번호를 입력해주세요"
        $0.font = .systemFont(ofSize: 14.0, weight: .medium)
        $0.autocapitalizationType = .none
        $0.backgroundColor = UIColor(red: 220/255, green: 220/225, blue: 220/225, alpha:1)
        $0.layer.cornerRadius = 25
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    func setup() {
        [
            idTextField, pwTextField
        ].forEach{ self.view.addSubview($0)}
        idTextField.snp.makeConstraints {
            $0.top.equalToSuperview().offset(-120)
            $0.bottom.equalToSuperview().offset(-70)
            $0.left.equalToSuperview().offset(70)
            $0.right.equalToSuperview().offset(0)
        }
        pwTextField.snp.makeConstraints {
            $0.top.equalTo(idTextField).offset(-120)
            $0.bottom.equalTo(idTextField).offset(-70)
            $0.left.equalToSuperview().offset(70)
            $0.right.equalToSuperview().offset(0)
        }
    }
}
