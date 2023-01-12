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
    let profileImageView = UIImageView().then {
        $0.image = UIImage(named: "love")
//        $0.layer.cornerRadius = 20
    }
    let studentNumber = UILabel().then {
        $0.text = "1117"
    }
    let name = UILabel().then {
        $0.text = "최시훈"
    }
    let title = UILabel().then {
        $0.text = "대소고 준비물"
    }
    let detail = UILabel().then {
        $0.text = "대소고 입학할때/n필요한거 알려주세요"
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
                    profileImageView
                ].forEach{ addSubview($0) }
                
                profileImageView.snp.makeConstraints{
                    $0.top.equalToSuperview().offset(20.0)
                    $0.leading.equalToSuperview().offset(5.0)
                    $0.bottom.equalToSuperview().offset(-5.0)
                }
    }
}
