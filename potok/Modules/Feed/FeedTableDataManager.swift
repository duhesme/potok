//
//  FeedTableDataManager.swift
//  potok
//
//  Created by Никита Владимирович on 06.06.2022.
//

import Foundation
import UIKit

class FeedTableDataManager: NSObject, UITableViewDataSource, UITableViewDelegate, FeedTableViewCellDelegate {
    
    weak var presenter: FeedPresenterProtocol!
    weak var feedTableView: UITableView!
    
    weak var currentVideoCell: FeedTableViewCell?
    
    var videos = [VideoEntity]()
    
    init(feedTableView: UITableView) {
        super.init()
        self.feedTableView = feedTableView
        self.feedTableView.register(FeedTableViewCell.self, forCellReuseIdentifier: FeedTableViewCell.identifier)
        self.feedTableView.dataSource = self
        self.feedTableView.delegate = self
    }
    
    func add(videos: [VideoEntity]) {
        var indexPathsToUpdate: [IndexPath] = []
        for index in self.videos.count..<(self.videos.count + videos.count) {
            indexPathsToUpdate.append(IndexPath(row: index, section: 0))
        }
        self.videos.append(contentsOf: videos)
        
        DispatchQueue.main.sync {
            feedTableView.insertRows(at: indexPathsToUpdate, with: .none)
            currentVideoCell = (self.feedTableView.visibleCells[0] as? FeedTableViewCell)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FeedTableViewCell.identifier, for: indexPath) as! FeedTableViewCell
        cell.configure(withVideoEntity: videos[indexPath.row])
        cell.delegate = self
        return cell
    }
    
    func likeButtonPressed() {
        presenter.likeButtonPressed()
    }
    
    func authorButtonPressed(authorURL url: URL) {
        presenter.authorButtonPressed(authorURL: url)
    }
    
    /// This method calls when user scrolls to next video. At this point video that was scrolled need to be stopped.
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        currentVideoCell?.stop()
        currentVideoCell = (self.feedTableView.visibleCells[0] as! FeedTableViewCell)
        currentVideoCell?.play()
        print("scrollViewDidEndDecelerating")
    }
    
}
