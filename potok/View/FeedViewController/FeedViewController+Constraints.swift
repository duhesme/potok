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
        feedCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        view.addSubview(feedCollectionView)
        feedCollectionView.backgroundColor = .black
        feedCollectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
}
