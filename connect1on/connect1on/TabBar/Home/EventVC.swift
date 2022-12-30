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
    let navigationBar = UINavigationBar().then {
        $0.backgroundColor = UIColor(red: 230.0/255, green: 230.0/255, blue: 230.0/255, alpha: 1)
    }
    let line = UIView().then {
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor(red: 200.0/255, green: 200.0/255, blue: 200.0/255, alpha: 1).cgColor
    }
    let explanation = UILabel().then {
        $0.text = "해커톤"
        $0.font = UIFont(name: "GangwonEduAll-OTFBold", size:60)
        $0.font.withSize(60)
        $0.textAlignment = .center //가운데 정렬
        
    }
    var images = [#imageLiteral(resourceName: "ground"), #imageLiteral(resourceName: "ground"), #imageLiteral(resourceName: "love"), #imageLiteral(resourceName: "ground"), #imageLiteral(resourceName: "love"),#imageLiteral(resourceName: "love")]
    let mainImage = UIImageView().then {
        $0.image = UIImage(named: "ground")
        $0.image = UIImage(named: "love")
        $0.image = UIImage(named: "ground")
        $0.image = UIImage(named: "ground")
        $0.image = UIImage(named: "ground")
        $0.image = UIImage(named: "ground")
        $0.image = UIImage(named: "ground")
        $0.image = UIImage(named: "ground")
        $0.image = UIImage(named: "ground")
        $0.image = UIImage(named: "ground")
    }
    let imagePageControl = UIPageControl().then {
        $0.currentPage = currentPage
        $0.numberOfPages = 16
        $0.pageIndicatorTintColor = .lightGray
        $0.currentPageIndicatorTintColor = .black
    }
    let scrollView = UIScrollView().then {
        $0.frame = UIScreen.main.bounds
        scrollView.contentSize = CGSize(width: UIScreen.main.bounds.width * CGFloat(mainIma.count), height: UIScreen.main.bounds.height)
        $0.alwaysBounceVertical = false
        $0.showsHorizontalScrollIndicator = false
        $0.showsVerticalScrollIndicator = false
        $0.isScrollEnabled = true
        $0.isPagingEnabled = true
        $0.bounces = false
        
    }
    private func addContentScrollView() {
           for i in 0..<images.count {
               let imageView = UIImageView()
               let xPos = scrollView.frame.width * CGFloat(i)
               imageView.frame = CGRect(x: xPos, y: 0, width: scrollView.bounds.width, height: scrollView.bounds.height)
               imageView.image = images[i]
               scrollView.addSubview(imageView)
               scrollView.contentSize.width = imageView.frame.width * CGFloat(i + 1)
           }
       }
//    for (index, imageName) in mainImage.enumerated() {
//        let image = UIImage(named: "graund")
//        let mainImage = UIImageView().then {
//            $0.image = UIImage(named: "ground")
//            $0.image = UIImage(named: "love")
//            $0.image = UIImage(named: "ground")
//            $0.image = UIImage(named: "ground")
//            $0.image = UIImage(named: "ground")
//            $0.image = UIImage(named: "ground")
//            $0.image = UIImage(named: "ground")
//            $0.image = UIImage(named: "ground")
//            $0.image = UIImage(named: "ground")
//            $0.image = UIImage(named: "ground")
//        }
//        mainImage.frame = UIScreen.main.bounds
//        mainImage.frame.origin.x = UIScreen.main.bounds.width * CGFloat(index)
//        scrollView.addSubview(imageView)
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setup()
        setupNavigationBarItem()
        scrollView.delegate = self
    
    }
    
}
extension EventVC {
    func setupNavigationBarItem() {
//        let backButton = UIBarButtonItem(
//            title: "Back",
//            image: UIImage(systemName: "chevron.left"),
//            target: self,
//            action: #selector(didTapBackButton)
//        )
        let backButton = UIBarButtonItem(
            image: UIImage(systemName: "paperplane"),
            style: .plain,
            target: self,
            action: #selector(didTapBackButton)
        )
        navigationItem.leftBarButtonItem = backButton
    }
    @objc func didTapBackButton() {
        self.dismiss(animated: true)
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        imagePageControl.currentPage = Int(floor(scrollView.contentOffset.x / UIScreen.main.bounds.width))
    }

    
    
    func setup() {
        [
            navigationBar, line, explanation, mainImage, scrollView
        ].forEach{ self.view.addSubview($0) }
        navigationBar.snp.makeConstraints {
            $0.top.equalToSuperview().offset(0)
            $0.bottom.equalTo(explanation).offset(-110)
            $0.left.equalToSuperview().offset(0)
            $0.right.equalToSuperview().offset(0)
        }
        line.snp.makeConstraints {
            $0.top.equalTo(navigationBar.snp.bottom).offset(0)
            $0.bottom.equalTo(navigationBar.snp.bottom).offset(1)
            $0.left.equalToSuperview().offset(0)
            $0.right.equalToSuperview().offset(0)
        }
        explanation.snp.makeConstraints {
            $0.top.equalToSuperview().offset(100)
            $0.bottom.equalTo(mainImage.snp.top).offset(-5)
            $0.left.equalToSuperview().offset(0)
            $0.right.equalToSuperview().offset(0)
        }
        scrollView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(170)
            $0.bottom.equalToSuperview().offset(-270)
            $0.left.equalToSuperview().offset(0)
            $0.right.equalToSuperview().offset(0)
        }
        mainImage.snp.makeConstraints {
            $0.top.equalToSuperview().offset(170)
            $0.bottom.equalToSuperview().offset(-270)
            $0.left.equalToSuperview().offset(0)
            $0.right.equalToSuperview().offset(0)
        }
    }
}
