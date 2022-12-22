//
//  TableViewCell.swift
//  connect1on
//
//  Created by 최시훈 on 2022/12/22.
//
import UIKit
import SnapKit
import Then

class MessageTableViewCell: UITableViewCell {
    lazy var userProfileImage: UIImageView = {
        let profileImage = UIImageView().then {
            $0.image = UIImage(named: "love")
            $0.layer.cornerRadius = 20
        }
        return profileImage
    }()
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        return label
    }()
    
    //나중에 읽음 표시로 수정할 것
    lazy var detailButton: UIButton = {
        let button = UIButton().then {
            $0.setImage(UIImage(systemName: "chevron.right"), for: .normal)
            $0.isUserInteractionEnabled = false
        }
        return button
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
    private func setup() {
        contentView.addSubview(userProfileImage)
        contentView.addSubview(nameLabel)
        contentView.addSubview(detailButton)
        userProfileImage.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(10)
            make.centerY.equalToSuperview()
            make.trailing.lessThanOrEqualTo(detailButton).offset(10)
        }
        nameLabel.snp.makeConstraints { make in
            make.left.equalTo(userProfileImage).offset(60)
            make.centerY.equalToSuperview()
            make.right.equalTo(detailButton).offset(10)
        }
        detailButton.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        detailButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().offset(-24)
        }
    }
}
