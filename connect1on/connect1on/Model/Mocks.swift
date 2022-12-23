//
//  Mocks.swift
//  connect1on
//
//  Created by 최시훈 on 2022/12/22.
//

import UIKit

func getStackMocks() -> [TableView] {
    return (0...0).map { TableView(profileImage:  UIImage(named: "love"), id: String($0), name: "최시훈 " + String($0)) }
}

//func getMessagesMock() -> [Message] {
//    return (0...3).map { Message(content: "message content \($0)")
//    }
//}
