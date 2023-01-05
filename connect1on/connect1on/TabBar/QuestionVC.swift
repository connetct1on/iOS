//
//  QuestionVC.swift
//  connect1on
//
//  Created by 최시훈 on 2022/11/13.
//
//

import UIKit

class QuestionVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        view.backgroundColor = .white
    }
    

}
extension QuestionVC {
    private func setupNavigationBar() {
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.backgroundColor = UIColor(red: 10.0/255, green:0.0/255, blue:114.0/255, alpha: 1)
        navigationController?.navigationBar.standardAppearance = navigationBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navigationBarAppearance
    }
}
