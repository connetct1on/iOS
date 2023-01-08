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

class QuestionVC: UIViewController {
    let tableView = UITableView().then {
        $0.register(QuestionTableViewCell.self, forCellReuseIdentifier: QuestionTableViewCell.className)
//        $0.delegate = self
//        $0.dataSource = self
    }
    
    var post = [QuestionTableView]()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        view.backgroundColor = .white
    }
}
extension QuestionVC {
    func setup() {
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
    }
    @objc func didTabAddBt() {
        let VC = AddVC()
        let navigationController = UINavigationController(rootViewController: VC)
        present(navigationController, animated: true, completion: nil)
    }
    
}
extension QuestionVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.post.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
    }
}
