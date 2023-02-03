//
//  QuestionTableViewCell.swift
//  connect1on
//
//  Created by 최시훈 on 2023/01/07.
//

import UIKit
import SnapKit
import Then
class QuestionTableViewCell: UITableViewCell {
//        let imageView = UIImageView().then {
//            $0.image = UIImage(named: "love")
//            $0.layer.cornerRadius = 10
//            $0.translatesAutoresizingMaskIntoConstraints = false
//        }
    let profileImageView = UILabel().then {
        $0.text = "image"
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = .systemFont(ofSize: 14.0, weight: .medium)
    }
    let studentNumber = UILabel().then {
        $0.text = "1117"
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = .systemFont(ofSize: 14.0, weight: .medium)
    }
    let name = UILabel().then {
        $0.text = "최시훈"
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = .systemFont(ofSize: 14.0, weight: .medium)
    }
    let title = UILabel().then {
        $0.text = "대소고 준비물"
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = .systemFont(ofSize: 20.0, weight: .bold)
    }
    let detail = UILabel().then {
        $0.text = "대소고 입할때 필요한거 알려주세요"
        $0.numberOfLines = 0
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = .systemFont(ofSize: 14.0, weight: .medium)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func setup() {
        [
            profileImageView,
            name,
            studentNumber,
            title,
            detail,
            
        ].forEach{ addSubview($0) }
        
        profileImageView.snp.makeConstraints{
            $0.top.equalToSuperview().offset(20)
            $0.left.equalToSuperview().offset(20)
            $0.right.equalTo(profileImageView.snp.left).offset(20)
            $0.bottom.equalTo(profileImageView.snp.top).offset(20)
        }
        name.snp.makeConstraints{
            $0.top.equalToSuperview().offset(20)
            $0.left.equalTo(profileImageView.snp.left).offset(0)
            $0.right.equalToSuperview().offset(0)
            $0.bottom.equalTo(profileImageView.snp.top).offset(20)
        }
        studentNumber.snp.makeConstraints{
            $0.top.equalToSuperview().offset(20)
            $0.left.equalTo(name.snp.left).offset(0)
            $0.right.equalToSuperview().offset(0)
            $0.bottom.equalTo(studentNumber.snp.top).offset(20)
        }
        title.snp.makeConstraints{
            $0.top.equalTo(profileImageView.snp.bottom).offset(10)
            $0.left.equalToSuperview().offset(0)
            $0.right.equalToSuperview().offset(0)
            $0.bottom.equalTo(title.snp.top).offset(30)
        }
        detail.snp.makeConstraints{
            $0.top.equalTo(title.snp.bottom).offset(5)
            $0.left.equalToSuperview().offset(0)
            $0.right.equalToSuperview().offset(0)
            $0.bottom.equalToSuperview().offset(0)
        }
        
    }
}
