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

class SltPstVC: UIViewController {
    let stuSignUpButton = UIButton().then {
        $0.backgroundColor = UIColor(red: 10.0/255, green:0.0/255, blue:114.0/255, alpha: 1)
        $0.setTitle("재학생 회원가입", for: .normal)
        $0.layer.cornerRadius = 20
        $0.addTarget(self, action: #selector(DidTabStuSignUpButton), for: .touchUpInside)
        
    }
    let newStuSignUpButton = UIButton().then {
        $0.backgroundColor = UIColor(red: 10.0/255, green:0.0/255, blue:114.0/255, alpha: 1)
        $0.setTitle("신입생 회원가입", for: .normal)
        $0.layer.cornerRadius = 20
        $0.addTarget(self, action: #selector(DidTabnewStuSignUpButton), for: .touchUpInside)
        
    }
    let prtSignUpButton = UIButton().then {
        $0.backgroundColor = UIColor(red: 10.0/255, green:0.0/255, blue:114.0/255, alpha: 1)
        $0.setTitle("학부모 회원가입", for: .normal)
        $0.layer.cornerRadius = 20
        $0.addTarget(self, action: #selector(DidTabPrtSignUpButton), for: .touchUpInside)
        
    }

    @objc func DidTabStuSignUpButton() {
        print("//")
        
    }
    @objc func DidTabnewStuSignUpButton() {
        print("//")
        
    }
    @objc func DidTabPrtSignUpButton() {
        print("//")
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        SltPstSetupNavigationBar()
        setup()
        
    }
    
    func SltPstSetupNavigationBar() {
        let sltPstNavigationBarAppearance = UINavigationBarAppearance()
        sltPstNavigationBarAppearance.backgroundColor = .systemBackground
        navigationController?.navigationBar.standardAppearance = sltPstNavigationBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = sltPstNavigationBarAppearance
        
    }
    private func setupNavigationBarItem() {
        let massageButton = UIBarButtonItem(
            image: UIImage(systemName: "paperplane"),
            style: .plain,
            target: self,
            action: #selector(didTabMassageButton)
        )

        navigationItem.rightBarButtonItem = massageButton
    }
    @objc func didTabMassageButton() {
        print("sex")
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
