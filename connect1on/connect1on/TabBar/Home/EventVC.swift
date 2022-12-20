//
//  EventVC.swift
//  connect1on
//
//  Created by 최시훈 on 2022/12/17.
//

import UIKit
import Then
import SnapKit

class EventVC: UIViewController {
    let explanation = UILabel().then {
        $0.text = "해커톤"
        $0.font = UIFont(name: "GangwonEduAll-OTFBold", size:60)
        $0.font.withSize(60)
        $0.textAlignment = .center //가운데 정렬
        
    }
    let image = UIImageView().then {
        $0.image = UIImage(named: "ground")
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setup()
        
    }
    func setup() {
        [
            explanation, image
        ].forEach{ self.view.addSubview($0) }
        explanation.snp.makeConstraints {
            $0.top.equalToSuperview().offset(100)
            $0.bottom.equalTo(image.snp.top).offset(-5)
            $0.left.equalToSuperview().offset(0)
            $0.right.equalToSuperview().offset(0)
        }
        image.snp.makeConstraints {
            $0.top.equalToSuperview().offset(170)
            $0.bottom.equalToSuperview().offset(-270)
            $0.left.equalToSuperview().offset(0)
            $0.right.equalToSuperview().offset(0)
        }
        
    }
}
