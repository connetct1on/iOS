//
//  Question.swift
//  connect1on
//
//  Created by 최시훈 on 2023/01/08.
//

import UIKit

struct Question {
    var profileImage = UIImage(named: "love")
    var studentNumber: String = "1117"
    var name: String = "최시훈"
    var title: String = "화장실에서"
    var detail: String = "똥 좀 싸도 되나요"
    
    init(profileImage: UIImage, studentNumber: String, name: String, title: String, detail: String) {
        self.profileImage = profileImage
        self.studentNumber = studentNumber
        self.name = name
        self.title = title
        self.detail = detail
    }
}
