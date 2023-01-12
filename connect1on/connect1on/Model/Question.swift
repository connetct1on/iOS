//
//  Question.swift
//  connect1on
//
//  Created by 최시훈 on 2023/01/08.
//

import UIKit

struct PostDatas {
//    var profileImage: UIImage(named: "love")
    var profileImage = UIImage(named: "love")
//    var studentNumber: String?
    var studentNumber = "1117"
//    var name: String?
    var name = "최시훈"
//    var title: String?
    var title = "화장실에..."
//    var detail: String?
    var detail = "화장실에 쓸 화장지 필요한가요?"
    
    init(profileImage : UIImage, studentNumber : String, name: String, title: String, detail: String) {
        self.profileImage = profileImage
        self.studentNumber = studentNumber
        self.name = name
        self.title = title
        self.detail = detail
    }
}
