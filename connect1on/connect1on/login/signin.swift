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
import Alamofire

class SigninVC: UIViewController {
    let logolb = UILabel().then {
        $0.text = "ALT"
        $0.font = UIFont(name: "GangwonEduAll-OTFBold", size:150)
        $0.font.withSize(60)
        $0.textAlignment = .center //가운데 정렬
        //$0.backgroundColor = UIColor(red: 180.0 / 255, green: 180.0 / 255, blue: 180.0 / 255, alpha: 1)
    }
    let idlb = UILabel().then {
        $0.font = UIFont(name: "GangwonEduAll-OTFBold", size: 20)
        $0.text = " ID"
        //$0.backgroundColor = UIColor(red: 220.0 / 255, green: 220.0 / 225, blue: 220.0 / 225, alpha: 0.3)
    }
    let idTextField = UITextField().then {
        $0.placeholder = "아이디를 입력해주세요"
        $0.font = .systemFont(ofSize: 14.0, weight: .medium)
        $0.autocapitalizationType = .none
        $0.backgroundColor = UIColor(red: 220.0 / 255, green: 220.0 / 225, blue: 220.0 / 225, alpha: 0.5)
        $0.layer.cornerRadius = 20
    }
    let pwlb = UILabel().then {
        $0.text = " PW"
        $0.font = UIFont(name: "GangwonEduAll-OTFBold", size: 20)
    }
    let pwTextField = UITextField().then {
        $0.placeholder = "비밀번호를 입력해주세요"
        $0.font = .systemFont(ofSize: 14.0, weight: .medium)
        $0.autocapitalizationType = .none
        $0.backgroundColor = UIColor(red: 220/255, green: 220/225, blue: 220/225, alpha: 1)
        $0.layer.cornerRadius = 20
    }
    let signinBt = UIButton().then {
        $0.backgroundColor = UIColor(red: 10.0/255, green:0.0/255, blue:114.0/255, alpha: 1)
        $0.setTitle("로그인", for: .normal)
        $0.layer.cornerRadius = 20
        $0.addTarget(self, action: #selector(TabsigninBt), for: .touchUpInside)
    }
    let signupBt = UIButton().then {
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 8)
        $0.setTitle("                                                       회원이 아니신가요? 회원가입", for: .normal)
        $0.setTitleColor(UIColor.black, for: .normal)
        $0.addTarget(self, action: #selector(TabsignupBt), for: .touchUpInside)
    }
    @objc func TabsigninBt() {
        let VC = TabBarcontroller()
        present(VC, animated: true, completion: nil)
        UIView.animate(withDuration: 0.3) {
            self.view.window?.rootViewController = TabBarcontroller()
        }
    }
    
    @objc func TabsignupBt() {
        print("signup")
        let VC = SltPstVC()
        present(VC, animated: true, completion: nil)
        self.view.window?.rootViewController = SltPstVC()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        setup()
    }
    func setup() {
        [
            logolb, idlb, idTextField, pwTextField, pwlb, pwTextField, signinBt, signupBt
        ].forEach{ self.view.addSubview($0)
        }
        logolb.snp.makeConstraints {
            $0.top.equalToSuperview().offset(150)
            $0.bottom.equalToSuperview().offset(-600)
            $0.left.equalToSuperview().offset(70)
            $0.right.equalToSuperview().offset(-70)
        }
        idlb.snp.makeConstraints {
            $0.top.equalTo(idTextField).offset(-25)
            $0.bottom.equalTo(idTextField).offset(-50)
            $0.left.equalToSuperview().offset(70)
            $0.right.equalToSuperview().offset(-70)
        }
        idTextField.snp.makeConstraints {
            $0.top.equalTo(logolb).offset(150)
            $0.bottom.equalTo(logolb).offset(100)
            $0.left.equalToSuperview().offset(70)
            $0.right.equalToSuperview().offset(-70)
        }
        pwlb.snp.makeConstraints {
            $0.top.equalTo(pwTextField).offset(-25)
            $0.bottom.equalTo(pwTextField).offset(-50)
            $0.left.equalToSuperview().offset(70)
            $0.right.equalToSuperview().offset(-70)
        }
        pwTextField.snp.makeConstraints {
            $0.top.equalTo(logolb).offset(250)
            $0.bottom.equalTo(logolb).offset(200)
            $0.left.equalToSuperview().offset(70)
            $0.right.equalToSuperview().offset(-70)
        }
        signinBt.snp.makeConstraints {
            $0.top.equalTo(logolb).offset(350)
            $0.bottom.equalTo(logolb).offset(300)
            $0.left.equalToSuperview().offset(70)
            $0.right.equalToSuperview().offset(-70)
        }
        signupBt.snp.makeConstraints {
            $0.top.equalTo(signinBt).offset(50)
            $0.bottom.equalTo(signinBt).offset(25)
            $0.left.equalToSuperview().offset(70)
            $0.right.equalToSuperview().offset(-70)
        }
    }
}
