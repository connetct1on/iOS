//
//  EventVC.swift
//  connect1on
//
//  Created by 최시훈 on 2022/12/17.
//

import UIKit
import Then
import SnapKit

class EventVC: UIViewController, UIScrollViewDelegate {
    let explanation = UILabel().then {
        $0.text = "graund"
        $0.font = UIFont(name: "GangwonEduAll-OTFBold", size:60)
        $0.font.withSize(60)
        $0.textAlignment = .center //가운데 정렬
    }
    var imageNames = ["ground", "love", "dgsw_logo"]
    let pageControl = UIPageControl().then {
        $0.currentPage = 3
        $0.numberOfPages = 3
        $0.pageIndicatorTintColor = .lightGray
        $0.currentPageIndicatorTintColor = .black
    }
    let scrollView = UIScrollView().then {
        $0.frame = UIScreen.main.bounds
        $0.alwaysBounceVertical = false
        $0.showsHorizontalScrollIndicator = false
        $0.showsVerticalScrollIndicator = false
        $0.isScrollEnabled = true
        $0.isPagingEnabled = true
        $0.bounces = false
    }
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "currentPage" {
            pageControlCondition()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setup()
        insertImageIntoScrollView()
        setupNavigationBar()
        setupNavigationBarItem()
        scrollViewSet()
        pageControl.addObserver(self, forKeyPath: "currentPage", options: [.new], context: nil)
    }
}
extension EventVC {
    func pageControlCondition() {
        switch pageControl.currentPage {
        case 0:
            explanation.text = "graund"
        case 1:
            explanation.text = "love"
        default:
            explanation.text = "dgsw_logo"
        }
    }
    func scrollViewSet() {
        scrollView.delegate = self
        scrollView.contentSize = CGSize(width: UIScreen.main.bounds.width * CGFloat(imageNames.count), height: UIScreen.main.bounds.height)
    }
    @objc func insertImageIntoScrollView() {
        for (index, imageName) in imageNames.enumerated() {
            let image = UIImage(named: imageName)
            let imageView = UIImageView(image: image)
            imageView.frame = UIScreen.main.bounds
            imageView.frame.origin.x = UIScreen.main.bounds.width * CGFloat(index)
            scrollView.addSubview(imageView)
        }
    }
    private func setupNavigationBar() {
        let navigationBar = UINavigationBarAppearance()
        navigationBar.backgroundColor = .secondColor; navigationController?.navigationBar.standardAppearance = navigationBar
        navigationController?.navigationBar.scrollEdgeAppearance = navigationBar
    }
    func setupNavigationBarItem() {
        let backButton = UIBarButtonItem(image: UIImage(systemName: "chevron.left"),
                                         style: .plain,
                                         target: self,
                                         action: #selector(didTapBackButton)
        )
        backButton.tintColor = UIColor .black
        navigationItem.leftBarButtonItem = backButton
    }
    @objc func didTapBackButton() {
        self.dismiss(animated: true)
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(floor(scrollView.contentOffset.x / UIScreen.main.bounds.width))
    }
    func setup() {
        [
            explanation, scrollView, pageControl
        ].forEach{ self.view.addSubview($0) }
        explanation.snp.makeConstraints {
            $0.top.equalToSuperview().offset(100)
            $0.bottom.equalTo(scrollView.snp.top).offset(-5)
            $0.left.equalToSuperview().offset(0)
            $0.right.equalToSuperview().offset(0)
        }
        scrollView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(170)
            $0.bottom.equalToSuperview().offset(-270)
            $0.left.equalToSuperview().offset(0)
            $0.right.equalToSuperview().offset(0)
        }
        pageControl.snp.makeConstraints {
            $0.bottom.equalTo(scrollView.snp.bottom).offset(-10)
            $0.left.equalTo(scrollView.snp.left).offset(0)
            $0.right.equalTo(scrollView.snp.right).offset(0)
        }
    }
}


