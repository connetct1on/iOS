//
//  MassageVC.swift
//  connect1on
//
//  Created by 최시훈 on 2022/11/24.
//

import UIKit
import MessageKit
import InputBarAccessoryView
import Photos
import Alamofire

class MessageVC: MessagesViewController {
    
    lazy var cameraBarButtonItem: InputBarButtonItem = {
        let button = InputBarButtonItem(type: .system)
        button.tintColor = .mainColor
        button.image = UIImage(systemName: "camera")
        button.addTarget(self, action: #selector(didTapCameraButton), for: .touchUpInside)
        return button
    }()
    
    let stack: TableView
    var sender = Sender(senderId: "id", displayName: "sihun")
    var messages = [Message]()
    private var isSendingPhoto = false {
        didSet {
            messageInputBar.leftStackViewItems.forEach { item in
                guard let item = item as? InputBarButtonItem else {
                    return
                }
                item.isEnabled = !self.isSendingPhoto
            }
        }
    }
    
    init(Stack: TableView) {
        self.stack = Stack
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupDelegates()
        setup()
        setupMessageInputBar()
        removeOutgoingMessageAvatars()
        addCameraBarButtonToMessageInputBar()
    }
    
    deinit {
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func setupDelegates() {
        messagesCollectionView.messagesDataSource = self
        messagesCollectionView.messagesLayoutDelegate = self
        messagesCollectionView.messagesDisplayDelegate = self
        
        messageInputBar.delegate = self
    }
    
    private func setup() {
        title = stack.name
        navigationController?.navigationBar.prefersLargeTitles = false
        //                messages = getMessagesMock()
    }
    
    private func setupMessageInputBar() {
        messageInputBar.inputTextView.tintColor = .mainColor
        messageInputBar.sendButton.setTitleColor(.mainColor, for: .normal)
        messageInputBar.inputTextView.placeholder = "Aa"
        messageInputBar.backgroundView.backgroundColor = UIColor(red: 240.0/255, green: 240.0/255, blue: 240.0/255, alpha: 1)
    }
    
    private func removeOutgoingMessageAvatars() {
        guard let layout = messagesCollectionView.collectionViewLayout as? MessagesCollectionViewFlowLayout else { return }
        layout.textMessageSizeCalculator.outgoingAvatarSize = .zero
        layout.setMessageOutgoingAvatarSize(.zero)
        let outgoingLabelAlignment = LabelAlignment(textAlignment: .right, textInsets: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 15))
        layout.setMessageOutgoingMessageTopLabelAlignment(outgoingLabelAlignment)
    }
    
    private func addCameraBarButtonToMessageInputBar() {
        messageInputBar.leftStackView.alignment = .center
        messageInputBar.setLeftStackViewWidthConstant(to: 50, animated: false)
        messageInputBar.setStackViewItems([cameraBarButtonItem], forStack: .left, animated: false)
    }
    
    private func insertNewMessage(_ message: Message) {
        messages.append(message)
        messages.sort()
        messagesCollectionView.reloadData()
    }
    
    @objc private func didTapCameraButton() {
        let picker = UIImagePickerController()
        picker.delegate = self
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            picker.sourceType = .camera
        } else {
            picker.sourceType = .photoLibrary
        }
        present(picker, animated: true)
    }
}

// 오류 고침
extension MessageVC: MessagesDataSource {
    var currentSender: MessageKit.SenderType {
        return sender
    }
    
    func numberOfSections(in messagesCollectionView: MessagesCollectionView) -> Int {
        return messages.count
    }
    
    func messageForItem(at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> MessageType {
        return messages[indexPath.section]
    }
    
    func messageTopLabelAttributedText(for message: MessageType, at indexPath: IndexPath) -> NSAttributedString? {
        let name = message.sender.displayName
        return NSAttributedString(string: name, attributes: [.font: UIFont.preferredFont(forTextStyle: .caption1),
                                                             .foregroundColor: UIColor(white: 0.3, alpha: 1)])
    }
}

extension MessageVC: MessagesLayoutDelegate {
    // 아래 여백
    func footerViewSize(for section: Int, in messagesCollectionView: MessagesCollectionView) -> CGSize {
        return CGSize(width: 0, height: 8)
    }
    
    // 말풍선 위 이름 나오는 곳의 height
    func messageTopLabelHeight(for message: MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> CGFloat {
        return 20
    }
    
}

// 상대방이 보낸 메시지, 내가 보낸 메시지를 구분하여 색상과 모양 지정
extension MessageVC: MessagesDisplayDelegate {
    // 말풍선의 배경 색상
    func backgroundColor(for message: MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> UIColor {
        return isFromCurrentSender(message: message) ? .systemYellow : .systemGray5
    }
    func textColor(for message: MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> UIColor {
        return isFromCurrentSender(message: message) ? .black : .black
    }
    
    
    // 말풍선의 꼬리 모양 방향
    func messageStyle(for message: MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> MessageStyle {
        let cornerDirection: MessageStyle.TailCorner = isFromCurrentSender(message: message) ? .bottomRight : .bottomLeft
        return .bubbleTail(cornerDirection, .curved)
    }
}

extension MessageVC: InputBarAccessoryViewDelegate {
    func inputBar(_ inputBar: InputBarAccessoryView, didPressSendButtonWith text: String) {
        let message = Message(content: text)
        insertNewMessage(message)
        inputBar.inputTextView.text.removeAll()
    }
}

extension MessageVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true)
        
        if let asset = info[.phAsset] as? PHAsset {
            let imageSize = CGSize(width: 500, height: 500)
            PHImageManager.default().requestImage(for: asset,
                                                  targetSize: imageSize,
                                                  contentMode: .aspectFit,
                                                  options: nil) { image, _ in
                guard let image = image else { return }
                self.sendPhoto(image)
            }
        } else if let image = info[.originalImage] as? UIImage {
            sendPhoto(image)
        }
    }
    
    private func sendPhoto(_ image: UIImage) {
        isSendingPhoto = true
        isSendingPhoto = false
        let message = Message(image: image)
        insertNewMessage(message)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true)
        
    }
}

