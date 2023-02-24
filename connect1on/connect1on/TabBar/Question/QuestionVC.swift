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
    var datas: [Question] = []
    let url = URL(string: "https://ifh.cc/g/J8wf2m.png")
    var images = ["love"]
    
    let tableView = UITableView(frame: .zero).then {
        $0.backgroundColor = .white
        $0.register(QuestionTableViewCell.self, forCellReuseIdentifier: QuestionTableViewCell.className)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
//        getQuestionMocks()
        setupTableView()
        configureTableView()
        setup()
        setupNavigationBar()
        setupNavigationBarItem()
        self.tableView.reloadData()
        view.backgroundColor = .white
    }
}
extension QuestionVC {
    func setupTableView(){
        view.addSubview(tableView)
        tableView.snp.makeConstraints{ $0.edges.equalToSuperview()}
    }
    func configureTableView() {
        tableView.dataSource = self
    }
    
    func setup() {
        [
            tableView 
        ].forEach{ self.view.addSubview($0)
        }
        tableView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(90)
            $0.bottom.equalToSuperview().offset(-83)
            $0.left.right.equalToSuperview().offset(0)
        }
    }
    
    func setupNavigationBar() {
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.backgroundColor = UIColor(red: 10.0/255, green:0.0/255, blue:114.0/255, alpha: 1)
        navigationController?.navigationBar.standardAppearance = navigationBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navigationBarAppearance
        navigationBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.red]
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
        let cell = tableView.dequeueReusableCell(withIdentifier: QuestionTableViewCell.className, for: indexPath) as? QuestionTableViewCell
        cell!.studentNumber.text = self.datas[indexPath.row].studentNumber
        cell!.name.text = self.datas[indexPath.row].name
        cell!.title.text = self.datas[indexPath.row].title
        cell!.detail.text = self.datas[indexPath.row].detail
        
        cell!.setup()
        cell!.selectionStyle = .none
        
        return cell ?? QuestionTableViewCell()
    }
}
