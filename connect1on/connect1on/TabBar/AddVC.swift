//
//  AddVC.swift
//  connect1on
//
//  Created by 최시훈 on 2023/01/06.
//

import UIKit
import Then
import SnapKit

class AddVC: UIViewController {
    let titleTextField = UITextField().then {
        $0.placeholder = "  제목을 입력하세요"
        $0.font = .systemFont(ofSize: 14.0, weight: .medium)
        $0.autocapitalizationType = .none
    }
    let line = UIView().then {
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor(red: 255.0/255, green: 255.0/255, blue: 255.0/255, alpha: 1).cgColor
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        view.backgroundColor = .white
        setupNavigationBarItem()
        setup()
    }
}
extension AddVC {
    private func setupNavigationBar() {
        let navigationBar = UINavigationBarAppearance()
        navigationBar.backgroundColor = .secondColor; navigationController?.navigationBar.standardAppearance = navigationBar
        navigationController?.navigationBar.scrollEdgeAppearance = navigationBar
    }
    func setupNavigationBarItem() {
        let backButton = UIBarButtonItem(image: UIImage(systemName: "chevron.left"),
                                         style: .plain,
                                         target: self,
                                         action: #selector(didTabBackButton)
        )
        backButton.tintColor = UIColor .black
        navigationItem.leftBarButtonItem = backButton
    }
    @objc func didTabBackButton() {
        self.dismiss(animated: true)
    }
    func setup() {
        [
            titleTextField,
            line,
            
        ].forEach{ self.view.addSubview($0)
        }
        titleTextField.snp.makeConstraints {
            $0.top.equalToSuperview().offset(-120)
            $0.bottom.equalToSuperview().offset(-70)
            $0.left.equalToSuperview().offset(70)
            $0.right.equalToSuperview().offset(0)
        }
        line.snp.makeConstraints {
            $0.top.equalToSuperview().offset(-120)
            $0.bottom.equalToSuperview().offset(-70)
            $0.left.equalToSuperview().offset(70)
            $0.right.equalToSuperview().offset(0)
        }
        
    }
}
