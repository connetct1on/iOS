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
        $0.font = .systemFont(ofSize: 150.0, weight: .medium)
        $0.textAlignment = .center //가운데 정렬
    }
    let idlb = UILabel().then {
        $0.font = UIFont(name: "GangwonEduAll-OTFBold", size: 20)
        $0.text = " ID"
    }
    lazy var idTextField = UITextField().then {
        $0.placeholder = "아이디를 입력해주세요"
        $0.font = .systemFont(ofSize: 14.0, weight: .medium)
        $0.autocapitalizationType = .none
        $0.backgroundColor = .secondColor
        $0.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 8.0, height: 0.0))
        $0.layer.cornerRadius = 20
    }
    let pwlb = UILabel().then {
        $0.text = " PW"
        $0.font = UIFont(name: "GangwonEduAll-OTFBold", size: 20)
    }
    lazy var pwTextField = UITextField().then {
        $0.placeholder = "비밀번호를 입력해주세요"
        $0.font = .systemFont(ofSize: 14.0, weight: .medium)
        $0.autocapitalizationType = .none
        $0.isSecureTextEntry = true
        $0.backgroundColor = .secondColor
        $0.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 8.0, height: 0.0))
        $0.layer.cornerRadius = 20
    }
    let signinBt = UIButton().then {
        $0.backgroundColor = .mainColor
        $0.setTitle("로그인", for: .normal)
        $0.layer.cornerRadius = 20
        $0.addTarget(self, action: #selector(TabsigninBt), for: .touchUpInside)
    }
    let signUpLabel = UILabel().then {
        $0.text = "계정이 없으시다고요??"
        $0.font = .systemFont(ofSize: 8.0)
        $0.textAlignment = .right
    }
    let signUpButton = UIButton().then {
        $0.setTitle("회원가입", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 10.0)
        $0.addTarget(self, action: #selector(didTabGoTosignUpButton), for: .touchUpInside)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setup()
        
    }
}
extension SigninVC {
    @objc func TabsigninBt() {
        let id = idTextField.text!
        let pw = pwTextField.text!
        print(id, pw)
        AF.request("\(api)/user/login.do",
                   method: .post,
                   parameters: ["emil": id,
                                "password": pw],
                   encoding : JSONEncoding.default,
                   headers: ["Content-Type": "application/json"]
        )
        .validate()
        .responseData { response in
            switch response.result {
            case.success:
                let VC = TabBarcontroller()
                VC.modalPresentationStyle = .fullScreen
                self.present(VC, animated: true, completion: nil)
                guard let value = response.value else { return }
                guard let result = try? JSONDecoder().decode(LoginData.self, from: value) else { return }
                UserDefaults.standard.set(result.data.token, forKey: "token")
                //                print("\(result.data.token)")
            case.failure(let error):
                print("통신 오류!\nCode:\(error._code), Message: \(error.errorDescription!)")
            }
        }
    }
    @objc func didTabGoTosignUpButton() {
            let VC = SignUpVC()
            present(VC, animated: true, completion: nil)
        }
    func setup() {
        [
            logolb, idlb, idTextField, pwTextField, pwlb, pwTextField, signinBt, signUpLabel, signUpButton
        ].forEach{ self.view.addSubview($0) }
        logolb.snp.makeConstraints {
            $0.top.equalToSuperview().offset(120)
            $0.bottom.equalTo(idTextField.snp.top).offset(-50)
            $0.left.equalToSuperview().offset(0)
            $0.right.equalToSuperview().offset(0)
        }
        idlb.snp.makeConstraints {
            $0.top.equalTo(idTextField.snp.top).offset(-25)
            $0.bottom.equalTo(idTextField.snp.top).offset(-10)
            $0.left.equalToSuperview().offset(70)
            $0.right.equalToSuperview().offset(-70)
        }
        idTextField.snp.makeConstraints {
            $0.bottom.equalTo(logolb.snp.bottom).offset(100)
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
            $0.top.equalTo(logolb.snp.bottom).offset(130)
            $0.bottom.equalTo(logolb.snp.bottom).offset(180)
            $0.left.equalToSuperview().offset(70)
            $0.right.equalToSuperview().offset(-70)
        }
        signinBt.snp.makeConstraints {
            $0.top.equalTo(pwTextField.snp.bottom).offset(20)
            $0.bottom.equalTo(pwTextField.snp.bottom).offset(70)
            $0.left.equalToSuperview().offset(70)
            $0.right.equalToSuperview().offset(-70)
        }
        signUpLabel.snp.makeConstraints {
                    $0.top.equalTo(signinBt.snp.bottom).offset(-5)
                    $0.bottom.equalTo(signUpLabel.snp.top).offset(20)
                    $0.left.equalToSuperview().offset(70)
                    $0.right.equalTo(signUpLabel.snp.left).offset(200)
                }
                signUpButton.snp.makeConstraints {
                    $0.top.equalTo(signinBt.snp.bottom).offset(5)
                    $0.bottom.equalTo(signUpButton.snp.top).offset(15)
                    $0.left.equalTo(signUpLabel.snp.right).offset(3)
                    $0.right.equalToSuperview().offset(-70)
                }
    }
}
