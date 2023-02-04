//
//  Question.swift
//  connect1on
//
//  Created by 최시훈 on 2023/01/08.
//

import UIKit

struct Question {
    var profileImageView: UIImage?
    var studentNumber: String?
    var name: String?
    var title: String?
    var detail: String?
    
    init(profileImageView: UIImage, studentNumber: String, name: String, title: String, detail: String) {
        self.profileImageView = profileImageView
        self.studentNumber = studentNumber
        self.name = name
        self.title = title
        self.detail = detail
    }
}
