//
//  MassageAPI.swift
//  connect1on
//
//  Created by 최시훈 on 2022/12/22.
//

import UIKit

struct Channel {
    var profileImage: UIImage?
    var id: String?
    let name: String
    
    init(profileImage: UIImage?, id: String? = nil, name: String) {
        self.profileImage = profileImage
        self.id = id
        self.name = name
    }
}

extension Channel: Comparable {
    static func == (lhs: Channel, rhs: Channel) -> Bool {
        return lhs.id == rhs.id
    }
    
    static func < (lhs: Channel, rhs: Channel) -> Bool {
        return lhs.name < rhs.name
    }
}
