//
//  NSObjc.swift
//  connect1on
//
//  Created by 최시훈 on 2022/12/22.
//

import UIKit
extension NSObject {
    static var className: String {
        return String(describing: self)
    }
}
