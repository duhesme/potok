//
//  FeedViewController+Constraints.swift
//  potok
//
//  Created by Никита Владимирович on 31.05.2022.
//

import Foundation
import UIKit

extension FeedViewController {
    
    func setUpLayoutConstraints() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: view.frame.size.width, height: view.frame.size.height)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        feedCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        feedCollectionView.frame = view.bounds
        feedCollectionView.isPagingEnabled = true
        feedCollectionView.backgroundColor = .black
        view.addSubview(feedCollectionView)
        feedCollectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
}
