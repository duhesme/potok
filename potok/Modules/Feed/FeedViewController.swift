//
//  ViewController.swift
//  potok
//
//  Created by Никита Владимирович on 31.05.2022.
//

import UIKit

class FeedViewController: UIViewController, FeedViewProtocol {
    
    func addVideos(forIndexPaths indexPaths: [IndexPath]) {
        feedTableView.insertRows(at: indexPaths, with: .none)
    }

    var presenter: FeedPresenterProtocol!
    let assembly: FeedAssemblyProtocol = FeedAssembly()
    
    var feedTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpLayoutConstraints()
        
        assembly.assemble(withViewController: self)
        presenter.configureView()
        
        feedTableView.register(FeedTableViewCell.self, forCellReuseIdentifier: FeedTableViewCell.identifier)
        feedTableView.dataSource = self
//        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
//            (self.feedTableView.visibleCells[0] as! FeedTableViewCell).play()
//        }
    }
    
}

extension FeedViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FeedTableViewCell.identifier) as! FeedTableViewCell
        cell.configure(withVideoEntity: presenter.videos[indexPath.row])
        return cell
    }
    
}
