//
//  JJDiscoverCollectionViewController.swift
//  JJMintFurniture
//
//  Created by 吉祥 on 2018/8/1.
//  Copyright © 2018年 JX.ZHANG. All rights reserved.
//

import UIKit

let JJDiscoverCollectionViewID = "JJDiscoverCollectionViewID"


class JJDiscoverCollectionViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "UICollectionView瀑布流"
        // 布局
        let layout = JJDiscoverCollectionViewFlowLayout()
        // 创建collectionView
        let collectionView = UICollectionView.init(frame: view.bounds, collectionViewLayout: layout)
        view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .white
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: JJDiscoverCollectionViewID)

    }
}
// MARK: - UICollectionViewDataSource, UICollectionViewDelegate
extension JJDiscoverCollectionViewController: UICollectionViewDataSource, UICollectionViewDelegate{
    // MARK: 每一组有多少个cell
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: JJDiscoverCollectionViewID, for: indexPath)
        
        cell.backgroundColor = UIColor.init(red: (CGFloat(arc4random_uniform(255) / 255)), green: (CGFloat(arc4random_uniform(255) / 255)), blue: (CGFloat(arc4random_uniform(255) / 255)), alpha: 1)
        print(CGFloat(arc4random_uniform(255)))
        return cell
    }
    // MARK: 多少组
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
}

