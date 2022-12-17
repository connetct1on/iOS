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
//    let explanation = UILabel().then {
////        $0.
//        
//    }
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
            image
        ].forEach{ self.view.addSubview($0) }
        image.snp.makeConstraints {
            $0.top.equalToSuperview().offset(220)
            $0.bottom.equalToSuperview().offset(-220)
            $0.left.equalToSuperview().offset(0)
            $0.right.equalToSuperview().offset(0)
            
        }
        
    }
}
