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
import Kingfisher

class QuestionVC: UIViewController {
    var datas: [PostDatas] = [
        PostDatas(profileImage: "as", studentNumber: "asdf1", name: "asdf1", title: "asdf1", detail: "asdf1")
    ]
    let url = URL(string: "https://ifh.cc/g/J8wf2m.png")
    
    let tableView = UITableView(frame: .zero).then {
        $0.backgroundColor = .white
        $0.register(QuestionTableViewCell.self, forCellReuseIdentifier: "QuestionTableViewCell")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.reloadData()
        setupTableView()
        setupNavigationBar()
        setupNavigationBarItem()
        configureTableView()
        setup()
        self.tableView.reloadData()
        view.backgroundColor = .white
    }
    
    func setupTableView(){
        view.addSubview(tableView)
        tableView.snp.makeConstraints{ $0.edges.equalToSuperview()}
    }

}
extension QuestionVC {
    func configureTableView() {
        tableView.dataSource = self
    }
    
    func setup() {
        [
            tableView
        ].forEach{ self.view.addSubview($0)
        }
        tableView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().offset(90)
            $0.left.right.equalToSuperview().offset(0)
            
        }
        
    }
    
    func setupNavigationBar() {
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.backgroundColor = UIColor(red: 10.0/255, green:0.0/255, blue:114.0/255, alpha: 1)
        navigationController?.navigationBar.standardAppearance = navigationBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navigationBarAppearance
    }
    
    func setupNavigationBarItem() {
        let AddBt = UIBarButtonItem(
            image: UIImage(systemName: "plus"),
            style: .plain,
            target: self,
            action: #selector(didTabAddBt)
        )
        navigationItem.title = "love"
        navigationController?.navigationBar.tintColor = .white
        navigationItem.titleView?.tintColor = .white
        navigationItem.rightBarButtonItem = AddBt
    }
    
    @objc func didTabAddBt() {
        let VC = AddVC()
        let navigationController = UINavigationController(rootViewController: VC)
        present(navigationController, animated: true, completion: nil)
    }
}
extension QuestionVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "QuestionTableViewCell", for: indexPath) as? QuestionTableViewCell
        
        cell!.profileImageView.text = self.datas[indexPath.row].profileImage
        cell!.studentNumber.text = self.datas[indexPath.row].studentNumber
        cell!.name.text = self.datas[indexPath.row].name
        cell!.title.text = self.datas[indexPath.row].title
        cell!.detail.text = self.datas[indexPath.row].detail
        
        cell!.setup()
        cell!.selectionStyle = .none
        
        return cell ?? QuestionTableViewCell()
    }
}
