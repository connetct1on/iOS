//
//  Message .swift
//  connect1on
//
//  Created by 최시훈 on 2022/12/22.
//

import MessageKit
import UIKit

struct Message: MessageType {
    
    let userName: String = "뫄 자신있나"
    let senderName: String = "뫄.. 자신없다"
    let id: String?
    var messageId: String {
        return id ?? UUID().uuidString
    }
    let content: String
    let sentDate: Date
    let sender: SenderType
    var kind: MessageKind {
        if let image = image {
            let mediaItem = ImageMediaItem(image: image)
            return .photo(mediaItem)
        } else {
            return .text(content)
        }
    }
    
    var image: UIImage?
    var downloadURL: URL?
    
    init(content: String) {
        sender = Sender(senderId: senderName, displayName: userName)
        self.content = content
        sentDate = Date()
        id = nil
    }
    
    init(image: UIImage) {
        sender = Sender(senderId: senderName, displayName:userName)
        self.image = image
        sentDate = Date()
        content = ""
        id = nil
    }
    
}

extension Message: Comparable {
  static func == (lhs: Message, rhs: Message) -> Bool {
    return lhs.id == rhs.id
  }

  static func < (lhs: Message, rhs: Message) -> Bool {
    return lhs.sentDate < rhs.sentDate
  }
}
