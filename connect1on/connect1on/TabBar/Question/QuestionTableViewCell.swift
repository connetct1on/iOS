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
        let profileImage = UIImageView().then {
            $0.image = UIImage(named: "love")
            $0.layer.cornerRadius = 10
        }
    let studentNumber = UILabel().then {
        $0.text = "1111"
        $0.font = .systemFont(ofSize: 14.0, weight: .medium)
    }
    let name = UILabel().then {
        $0.text = "name"
        $0.font = .systemFont(ofSize: 14.0, weight: .medium)
    }
    let title = UILabel().then {
        $0.text = "title"
        $0.font = .systemFont(ofSize: 20.0, weight: .bold)
    }
    let detail = UILabel().then {
        $0.text = "detail"
        $0.numberOfLines = 0
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
            profileImage,
            name,
            studentNumber,
            title,
            detail,
            
        ].forEach{ addSubview($0) }
        
        profileImage.snp.makeConstraints{
            $0.top.equalToSuperview().offset(20)
            $0.left.equalToSuperview().offset(20)
            $0.right.equalTo(profileImage.snp.left).offset(20)
            $0.bottom.equalTo(profileImage.snp.top).offset(20)
        }
        name.snp.makeConstraints{
            $0.top.equalToSuperview().offset(20)
            $0.left.equalTo(profileImage.snp.left).offset(0)
            $0.right.equalToSuperview().offset(0)
            $0.bottom.equalTo(profileImage.snp.top).offset(20)
        }
        studentNumber.snp.makeConstraints{
            $0.top.equalToSuperview().offset(20)
            $0.left.equalTo(name.snp.left).offset(0)
            $0.right.equalToSuperview().offset(0)
            $0.bottom.equalTo(studentNumber.snp.top).offset(20)
        }
        title.snp.makeConstraints{
            $0.top.equalTo(profileImage.snp.bottom).offset(10)
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
