//
//  signin API.swift
//  connect1on
//
//  Created by 최시훈 on 2022/11/30.
//

import Foundation

struct LoginData: Decodable, Hashable {
    let status: Int
    let message: String
    let data: LoginDatas
}

struct LoginDatas: Decodable, Hashable {
    let token: String
}
