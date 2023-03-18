//
//  SignUpVC.swift
//  Socket
//
//  Created by 최시훈 on 2023/02/24.
//

import UIKit
import SnapKit
import Then
import Alamofire

class SignUpVC: UIViewController {
    let logo = UILabel().then {
        $0.text = "asdf"
        $0.font = UIFont(name: "GangwonEduAll-OTFBold", size:100)
        $0.textAlignment = .center
    }
    let emailTextField = UITextField().then {
        $0.placeholder = "이메일을 입력해주세요"
        $0.font = .systemFont(ofSize:14.0, weight: .medium)
        $0.autocapitalizationType = .none
        $0.backgroundColor = .secondColor
        $0.layer.cornerRadius = 15
        $0.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 8.0, height: 0.0))
        $0.leftViewMode = .always
    }
    let nameTextField = UITextField().then {
        $0.placeholder = "이름를 입력해주세요"
        $0.font = .systemFont(ofSize:14.0, weight: . medium)
        $0.autocapitalizationType = .none
        $0.backgroundColor = .secondColor
        $0.layer.cornerRadius = 15
        $0.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 8.0, height: 0.0))
        $0.leftViewMode = .always
    }
    let pwTextField = UITextField().then {
        $0.placeholder = "  비밀번호를 입력해주세요"
        $0.font = .systemFont(ofSize:14.0, weight: . medium)
        $0.autocapitalizationType = .none
        $0.isSecureTextEntry = true
        $0.backgroundColor = .secondColor
        $0.layer.cornerRadius = 15
        $0.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 8.0, height: 0.0))
        $0.leftViewMode = .always
    }
    private let signUpButton = UIButton().then {
        $0.backgroundColor = .mainColor
        $0.setTitle("로그인", for: .normal)
        $0.layer.cornerRadius = 20
        $0.addTarget(self, action: #selector(didTabsignUpButton), for: .touchUpInside)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setup()
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            view.endEditing(true)
        }
}
extension SignUpVC {
    @objc func didTabsignUpButton() {
        let id = emailTextField.text!
        let name = nameTextField.text!
        let pw = pwTextField.text!
        print(id, name, pw)
        /*
        AF.request("\(api)/user/signup.do",
                   method: .post,
                   parameters: ["email": id,
                                "name": name,
                                "password": pw],
                   encoding : JSONEncoding.default,
                   headers: ["Content-Type": "application/json"]
        )
        .validate()
        .responseData { response in
            switch response.result {
            case.success:
                self.dismiss(animated: true)
            case.failure(let error):
                print("통신 오류!\nCode:\(error._code), Message: \(error.errorDescription!)")
            }
        }
         */
        func request<T: Decodable>(url: String, // 요청을 보낼 URL
                                   method: HTTPMethod, // HTTP 요청 메서드 (GET, POST 등)
                                   params: [String: Any]? = nil, // 요청에 추가할 매개변수 (기본값: nil)
                                   _ model: T.Type, // 응답 데이터를 디코딩할 모델의 타입
                                   completion: @escaping (T) -> Void) { // 응답 데이터를 처리할 클로저
            AF.request("\(api)/user/signup.do", // Alamofire를 사용하여 요청을 보냄
                       method: .post, // HTTP 요청 메서드
                       parameters: [    "email": id,
                                        "name": name,
                                        "password": pw
                                   ], // 요청에 추가할 매개변수
                       encoding: method == .get ? URLEncoding.default : JSONEncoding.default, // 요청 본문의 인코딩 방식 (GET 요청은 URL 쿼리 문자열, 그 외는 JSON 형식)
                       interceptor: Interceptor() // 요청 인터셉터 (기본값: nil)
            )
            .responseData { response in // 요청 결과를 받아옴
                switch response.result { // 요청 결과에 대한 처리
                case .success: // 성공한 경우
                    self.dismiss(animated: true)
                    if let data = response.data { // 응답 데이터가 있는 경우
                        let decoder = JSONDecoder() // JSON 디코더 생성
                        print(String(decoding: response.data!, as: UTF8.self)) // 응답 데이터 로그 출력
                        if let decodedData = try? decoder.decode(T.self, from: data) { // 응답 데이터를 모델 타입으로 디코딩
                            DispatchQueue.main.async { // 메인 스레드에서 클로저 실행
                                completion(decodedData)// 디코딩된 데이터를 클로저로 전달
                            }
                        }
                    }
                case .failure(let error): // 실패한 경우
                    print("🚫\(error)🚫") // 에러 로그 출력
                }
            }
        }

    }
    func setup() {
        [logo,
         emailTextField,
         nameTextField,
         pwTextField,
         signUpButton
        ].forEach{ self.view.addSubview($0) }
        logo.snp.makeConstraints {
            $0.top.equalToSuperview().offset(150)
            $0.bottom.equalTo(logo.snp.top).offset(100)
            $0.left.equalToSuperview().offset(70)
            $0.right.equalToSuperview().offset(-70)
        }
        emailTextField.snp.makeConstraints {
            $0.top.equalTo(logo.snp.bottom).offset(75)
            $0.bottom.equalTo(emailTextField.snp.top).offset(50)
            $0.left.equalToSuperview().offset(70)
            $0.right.equalToSuperview().offset(-70)
        }
        nameTextField.snp.makeConstraints {
            $0.top.equalTo(emailTextField.snp.bottom).offset(20)
            $0.bottom.equalTo(nameTextField.snp.top).offset(50)
            $0.left.equalToSuperview().offset(70)
            $0.right.equalToSuperview().offset(-70)
        }
        pwTextField.snp.makeConstraints {
            $0.top.equalTo(nameTextField.snp.bottom).offset(20)
            $0.bottom.equalTo(pwTextField.snp.top).offset(50)
            $0.left.equalToSuperview().offset(70)
            $0.right.equalToSuperview().offset(-70)
        }
        signUpButton.snp.makeConstraints {
            $0.top.equalTo(pwTextField.snp.bottom).offset(20)
            $0.bottom.equalTo(signUpButton.snp.top).offset(60)
            $0.left.equalToSuperview().offset(70)
            $0.right.equalToSuperview().offset(-70)
        }
    }
}
extension SignUpVC {
//    func request<T: Decodable>(url: "\(api)/user/signup.do", // 요청을 보낼 URL
//                               method: .post, // HTTP 요청 메서드 (GET, POST 등)
//                               params: [String: Any]? = nil, // 요청에 추가할 매개변수 (기본값: nil)
//                               _ model: T.Type, // 응답 데이터를 디코딩할 모델의 타입
//                               completion: @escaping (T) -> Void) { // 응답 데이터를 처리할 클로저
//        AF.request(url as! URLConvertible, // Alamofire를 사용하여 요청을 보냄
//                   method: .post, // HTTP 요청 메서드
//                   parameters: ["email": id,
//                                "name": name,
//                                "password": pw], // 요청에 추가할 매개변수
//                   encoding: method == .get ? URLEncoding.default : JSONEncoding.default, // 요청 본문의 인코딩 방식 (GET 요청은 URL 쿼리 문자열, 그 외는 JSON 형식)
//                   interceptor: Interceptor() // 요청 인터셉터 (기본값: nil)
//        )
//        .responseData { response in // 요청 결과를 받아옴
//            switch response.result { // 요청 결과에 대한 처리
//            case .success: // 성공한 경우
//                if let data = response.data { // 응답 데이터가 있는 경우
//                    let decoder = JSONDecoder() // JSON 디코더 생성
//                    let dateFormatter = DateFormatter() // 날짜 포맷터 생성
//                    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSSSS" // 날짜 포맷 설정
//                    decoder.dateDecodingStrategy = .formatted(dateFormatter) // JSONDecoder에 날짜 포맷 적용
//                    print(String(decoding: response.data!, as: UTF8.self)) // 응답 데이터 로그 출력
//                    if let decodedData = try? decoder.decode(T.self, from: data) { // 응답 데이터를 모델 타입으로 디코딩
//                        DispatchQueue.main.async { // 메인 스레드에서 클로저 실행
//                            completion(decodedData) // 디코딩된 데이터를 클로저로 전달
//                        }
//                    }
//                }
//            case .failure(let error): // 실패한 경우
//                print(error) // 에러 로그 출력
//            }
//        }
//    }

}
