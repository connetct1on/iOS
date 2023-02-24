//
//  Mocks.swift
//  connect1on
//
//  Created by 최시훈 on 2022/12/22.
//

import UIKit

@discardableResult
//func getQuestionMocks() -> [Question] {
//    return (0...0).map {Question(profileImage:  UIImage(named: "love")!, studentNumber: "1117" + String($0), name: "최시훈" + String($0), title: "화장실갈때..."  + String($0), detail: "휴지 필요한가요??" + String($0)) }
//}
func getStackMocks() -> [Channel] {
    return (0...0).map { Channel(profileImage:  UIImage(named: "love"), id: String($0), name: "최시훈" + String($0)) }
}

//func getMessagesMock() -> [Message] {
//    return (0...3).map { Message(content: "message content \($0)")
//    }
//}
