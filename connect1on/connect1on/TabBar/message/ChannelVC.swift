//
//  StackViewVC.swift
//
//
//  Created by 최시훈 on 2022/12/07.
//

import UIKit
import Then
import SnapKit
import MessageKit

class ChannelVC: UIViewController {
    
    var Messages = [Channel]()
    
    lazy var channelView: UITableView = {
        let view = UITableView()
        view.register(MessageTableViewCell.self, forCellReuseIdentifier: MessageTableViewCell.className)
        view.delegate = self
        view.dataSource = self
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        Messages = channelCell()
        
    }
    
    private func setup() {
        view.addSubview(channelView)
        channelView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
    }
}
extension ChannelVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Messages.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MessageTableViewCell.className, for: indexPath) as! MessageTableViewCell
        cell.nameLabel.text = Messages[indexPath.row].name
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = Messages[indexPath.row]
        let viewController = MessageVC(Stack: cell)
        navigationController?.pushViewController(viewController, animated: true)
    }
}
extension ChannelVC {
    func channelCell() -> [Channel] {
        let channel = Channel(profileImage: UIImage(named: "love"), id: "Asdf", name: "최시훈")
            return [channel]
    }
}
