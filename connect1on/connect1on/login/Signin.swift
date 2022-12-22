//
//  SigninVC.swift
//  connect1on
//
//  Created by 최시훈 on 2022/11/17.
//

import UIKit
import SnapKit
import Then
import Alamofire

class SigninVC: UIViewController {
    class Login {
        var id: String = ""
        var pw: String = ""
        var wrongId: Bool = false
        var wrongPw: Bool = false
        var request: Bool = false
        var success: Bool = false
    }
    let logolb = UILabel().then {
        $0.text = "ALT"
        $0.font = UIFont(name: "GangwonEduAll-OTFBold", size:150)
        $0.font.withSize(58)
        $0.textAlignment = .center //가운데 정렬
        //$0.backgroundColor = UIColor(red: 180.0 / 255, green: 180.0 / 255, blue: 180.0 / 255, alpha: 1)
    }
    let idlb = UILabel().then {
        $0.font = UIFont(name: "GangwonEduAll-OTFBold", size: 20)
        $0.text = " ID"
        //$0.backgroundColor = UIColor(red: 220.0 / 255, green: 220.0 / 225, blue: 220.0 / 225, alpha: 0.3)
    }
    lazy var idTextField = UITextField().then {
        $0.placeholder = "  아이디를 입력해주세요"
        $0.font = .systemFont(ofSize: 14.0, weight: .medium)
        $0.autocapitalizationType = .none
        $0.backgroundColor = UIColor(red: 220.0/255, green: 220.0/255, blue: 220.0/255, alpha: 1)
        $0.layer.cornerRadius = 20
    }
    let pwlb = UILabel().then {
        $0.text = " PW"
        $0.font = UIFont(name: "GangwonEduAll-OTFBold", size: 20)
    }
    lazy var pwTextField = UITextField().then {
        $0.placeholder = "  비밀번호를 입력해주세요"
        $0.font = .systemFont(ofSize: 14.0, weight: .medium)
        $0.autocapitalizationType = .none
        $0.isSecureTextEntry = true
        $0.backgroundColor = UIColor(red: 220.0/255, green: 220.0/255, blue: 220.0/255, alpha: 1)
        $0.layer.cornerRadius = 20
    }
    let signinBt = UIButton().then {
        $0.backgroundColor = UIColor(red:  10.0/255, green:0.0/255, blue:114.0/255, alpha: 1)
        $0.setTitle("로그인", for: .normal)
        $0.layer.cornerRadius = 20
        $0.addTarget(self, action: #selector(TabsigninBt), for: .touchUpInside)
    }
    @objc func TabsigninBt() {
        let id = idTextField.text!
        let pw = pwTextField.text!
        print(id, pw)
//        AF.request("\(api)/user/signin.do",
//                   method: .post,
//                   parameters: ["empnum": Login.id,
//                                "password": Login.pw],
//                   encoding : JSONEncoding.default,
//                   headers: ["Content-Type": "application/json"]
//        )
//        .validate()
//        .responseData { response in
//            switch response.result {
//            case.success:
                let VC = TabBarcontroller()
                VC.modalPresentationStyle = .fullScreen
                self.present(VC, animated: true, completion: nil)
//                guard let value = response.value else { return }
//                guard let result = try? JSONDecoder().decode(LoginData.self, from: value) else { return }
//                UserDefaults.standard.set(result.data.token, forKey: "token")
//            case.failure(let error):
//                print("통신 오류!\nCode:\(error._code), Message: \(error.errorDescription!)")
//            }
//        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setup()
        
    }
    
    func setup() {
        [
            logolb, idlb, idTextField, pwTextField, pwlb, pwTextField, signinBt
        ].forEach{ self.view.addSubview($0)
        }
        logolb.snp.makeConstraints {
            $0.top.equalToSuperview().offset(150)
            $0.bottom.equalToSuperview().offset(-580)
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
            $0.bottom.equalTo(logolb).offset(90)
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
            $0.top.equalTo(logolb).offset(230)
            $0.bottom.equalTo(logolb).offset(170)
            $0.left.equalToSuperview().offset(70)
            $0.right.equalToSuperview().offset(-70)
        }
        signinBt.snp.makeConstraints {
            $0.top.equalTo(logolb).offset(310)
            $0.bottom.equalTo(logolb).offset(250)
            $0.left.equalToSuperview().offset(70)
            $0.right.equalToSuperview().offset(-70)
        }
    }
}