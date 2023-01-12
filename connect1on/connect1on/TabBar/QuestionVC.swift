//
//  QuestionVC.swift
//  connect1on
//
//  Created by 최시훈 on 2022/11/13.
//
//

import UIKit
import Then
import SnapKit

class QuestionVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var postDatas = [PostDatas]()
    let tableView = UITableView().then {
        $0.register(QuestionTableViewCell.self, forCellReuseIdentifier: QuestionTableViewCell.className)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupNavigationBarItem()
        view.backgroundColor = .white
        tableView.dataSource = self
        tableView.delegate = self
    }
}
extension QuestionVC {
    private func setup() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    private func setupNavigationBar() {
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.backgroundColor = UIColor(red: 10.0/255, green:0.0/255, blue:114.0/255, alpha: 1)
        navigationController?.navigationBar.standardAppearance = navigationBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navigationBarAppearance
    }
    private func setupNavigationBarItem() {
        let AddBt = UIBarButtonItem(
            image: UIImage(systemName: "plus"),
            style: .plain,
            target: self,
            action: #selector(didTabAddBt)
        )
        navigationItem.rightBarButtonItem = AddBt
    }
    @objc func didTabAddBt() {
        let VC = AddVC()
        let navigationController = UINavigationController(rootViewController: VC)
        present(navigationController, animated: true, completion: nil)
    }
    
}
extension QuestionVC {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.postDatas.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: QuestionTableViewCell.className, for: indexPath) as! QuestionTableViewCell
        
        cell.profileImageView.image = self.postDatas[indexPath.section].profileImage
        cell.studentNumber.text = self.postDatas[indexPath.section].studentNumber
        cell.name.text = self.postDatas[indexPath.section].name
        cell.title.text = self.postDatas[indexPath.section].title
        cell.detail.text = self.postDatas[indexPath.section].detail
        
        return cell
    }
}
