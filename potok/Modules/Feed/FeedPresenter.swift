//
//  FeedPresenter.swift
//  potok
//
//  Created by Никита Владимирович on 03.06.2022.
//

import Foundation



class FeedPresenter: FeedPresenterProtocol {
    
    var videos = [VideoEntity]()
    
    weak var view: FeedViewProtocol!
    var interactor: FeedInteractorProtocol!
    var router: FeedRouterProtocol!
    
    required init(view: FeedViewProtocol) {
        self.view = view
    }
    
    // MARK: - FeedPresenterProtocol methods
    
    func configureView() {
        print("Initial view configuration.")
    }
    
    func likeButtonPressed() {
        
    }
    
    func saveButtonPressed() {
        
    }
    
    func add(videos: [VideoEntity]) {
        
        
        var indexPathsToUpdate: [IndexPath] = []
        for index in self.videos.count..<(self.videos.count + videos.count) {
            indexPathsToUpdate.append(IndexPath(row: index, section: 0))
        }
        self.videos.append(contentsOf: videos)
        DispatchQueue.main.sync {
            self.view.addVideos(forIndexPaths: indexPathsToUpdate)
        }
    }
    
}
