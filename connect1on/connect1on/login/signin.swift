//
//  signin.swift
//  connect1on
//
//  Created by 최시훈 on 2022/11/17.
//

import Foundation
import UIKit
import SnapKit
import Then

class SigninVC: UIViewController {
    let logolb = UILabel().then {
            $0.text = "ALT"
            $0.font = UIFont(name: "", size: 60)
            $0.font.withSize(60)
        }
        let idlb = UILabel().then {
            $0.font = UIFont(name: "", size: 20)
            $0.text = " ID"
        }
        let idTextField = UITextField().then {
            $0.placeholder = "아이디를 입력해주세요"
            $0.font = .systemFont(ofSize: 14.0, weight: .medium)
            $0.autocapitalizationType = .none
            $0.backgroundColor = UIColor(red: 220/255, green: 220/225, blue: 220/225, alpha: 1)
            $0.layer.cornerRadius = 25
        }
        let pwlb = UILabel().then {
            $0.text = " PW"
            $0.font = UIFont(name: "", size: 20)
        }
        let pwTextField = UITextField().then {
            $0.placeholder = "비밀번호를 입력해주세요"
            $0.font = .systemFont(ofSize: 14.0, weight: .medium)
            $0.autocapitalizationType = .none
            $0.backgroundColor = UIColor(red: 220/255, green: 220/225, blue: 220/225, alpha: 1)
            $0.layer.cornerRadius = 25
        }
        
        let signinBt = UIButton().then {
            $0.backgroundColor = UIColor(red: 10.0/255, green:0.0/255, blue:114.0/255, alpha: 1)
            $0.setTitle("로그인", for: .normal)
            $0.addTarget(self, action: #selector(TabsigninBt), for: .touchUpInside)
        }
        let signupBt = UIButton().then {
            $0.setTitle("회원이 아니신가요? 회원가입", for: .normal)
            $0.addTarget(self, action: #selector(TabsignupBt), for: .touchUpInside)
        }
        @objc func TabsigninBt() {
            let VC = StuSignUpVC()
            present(VC, animated: true, completion: nil)
        }
        @objc func TabsignupBt() {
            print("signup")
            
        }
        override func viewDidLoad() {
            super.viewDidLoad()
            view.backgroundColor = .systemBackground
            signinBt.layer.cornerRadius = 25
            setup()
        }
    func setup() {
        [
            logolb, idlb, idTextField, pwTextField, pwlb, pwTextField, signinBt, signupBt
        ].forEach{ self.view.addSubview($0)
        }
        logolb.snp.makeConstraints {
            $0.top.equalTo(idTextField).offset(-120)
            $0.bottom.equalTo(idTextField).offset(-70)
            $0.left.equalToSuperview().offset(70)
            $0.right.equalToSuperview().offset(0)
        }
        idlb.snp.makeConstraints {
            $0.top.equalTo(idTextField).offset(-50)
            $0.bottom.equalTo(idTextField).offset(-40)
            $0.left.equalToSuperview().offset(40)
            $0.right.equalToSuperview().offset(-40)
        }
        idTextField.snp.makeConstraints {
            $0.top.equalToSuperview().offset(320)
            $0.bottom.equalToSuperview().offset(-450)
            $0.left.equalToSuperview().offset(40)
            $0.right.equalToSuperview().offset(-40)
        }
        pwlb.snp.makeConstraints {
            $0.top.equalTo(pwTextField).offset(-50)
            $0.bottom.equalTo(pwTextField).offset(-40)
            $0.left.equalToSuperview().offset(40)
            $0.right.equalToSuperview().offset(-40)
        }
        pwTextField.snp.makeConstraints {
            $0.top.equalTo(idTextField).offset(100)
            $0.bottom.equalTo(idTextField).offset(100)
            $0.left.equalToSuperview().offset(40)
            $0.right.equalToSuperview().offset(-40)
        }
        signinBt.snp.makeConstraints {
            $0.top.equalTo(idTextField).offset(200)
            $0.bottom.equalTo(idTextField).offset(200)
            $0.left.equalToSuperview().offset(40)
            $0.right.equalToSuperview().offset(-40)
        }
        signupBt.snp.makeConstraints {
            $0.top.equalTo(idTextField).offset(-300)
            $0.bottom.equalTo(idTextField).offset(-300)
            $0.left.equalToSuperview().offset(40)
            $0.right.equalToSuperview().offset(-40)
        }
    }
        }
