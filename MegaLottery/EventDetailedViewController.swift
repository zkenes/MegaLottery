//
//  EventDetailedViewController.swift
//  MegaLottery
//
//  Created by Zhanserik on 11/6/16.
//  Copyright © 2016 Kenes Inc. All rights reserved.
//

import UIKit
import EasyPeasy

class EventDetailedViewController: UIViewController {

    private lazy var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: self.view.frame.width, height: 100)
        return layout
    }()
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: self.layout)
        collectionView.bounces = true
        collectionView.register(SliderCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        
        return collectionView
    }()
    
    lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        return pageControl
    }()
    
    func setupView(){
        self.view.addSubview(collectionView)
        view.addSubview(pageControl)
    }
    
    func setupConstraints(){
        collectionView <- [
            Top(64),
            Left(0),
            Right(0),
            Height(155)
        ]
        pageControl <- [
            CenterX(0),
            Bottom(5).to(collectionView),
            Width(200)
        ]
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupView()
        setupConstraints()
    }
}

extension EventDetailedViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        pageControl.numberOfPages = 10
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! SliderCollectionViewCell
        cell.imageView.backgroundColor = indexPath.row % 2 == 0 ? .red : .blue
        return cell
    }
}

extension EventDetailedViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        let xOffset = scrollView.contentOffset.x
//        pageControl.currentPage = Int(xOffset / scrollView.frame.width)
    }
}
