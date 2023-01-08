//
//  Question.swift
//  connect1on
//
//  Created by 최시훈 on 2023/01/08.
//

import UIKit

struct QuestionTableView {
    var profileImage: UIImage?
    var studentNumber: Int?
    var name: String?
    var title: String?
    var detail: String?
    
    init(profileImage : UIImage, studentNumber : Int, name: String, title: String, detail: String) {
        self.profileImage = profileImage
        self.studentNumber = studentNumber
        self.name = name
        self.title = title
        self.detail = detail
    }
}
