//
//  ViewController.swift
//  potok
//
//  Created by Никита Владимирович on 31.05.2022.
//

import UIKit

class FeedViewController: UIViewController, FeedViewProtocol {

    var presenter: FeedPresenterProtocol!
    let assembly: FeedAssemblyProtocol = FeedAssembly()
    
    var feedCollectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpLayoutConstraints()
        
        assembly.assemble(withViewController: self)
        presenter.configureView()
        
        feedCollectionView.register(FeedCollectionViewCell.nib, forCellWithReuseIdentifier: FeedCollectionViewCell.identifier)
        feedCollectionView.dataSource = self
    }
    
    func addVideos() {
        print("adding videos...")
    }

}

extension FeedViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return collectionView.dequeueReusableCell(withReuseIdentifier: FeedCollectionViewCell.identifier, for: indexPath) as! FeedCollectionViewCell
    }
    
}

