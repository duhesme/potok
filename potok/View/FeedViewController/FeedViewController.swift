//
//  ViewController.swift
//  potok
//
//  Created by Никита Владимирович on 31.05.2022.
//

import SnapKit

class FeedViewController: UIViewController {

    var feedCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpLayoutConstraints()
        
        feedCollectionView.register(FeedCollectionViewCell.nib, forCellWithReuseIdentifier: FeedCollectionViewCell.identifier)
        feedCollectionView.dataSource = self
    }

}

extension FeedViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return collectionView.dequeueReusableCell(withReuseIdentifier: FeedCollectionViewCell.identifier, for: indexPath) as! FeedCollectionViewCell
    }
    
}

