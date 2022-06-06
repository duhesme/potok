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
    
    var feedTableDataManager: FeedTableDataManager!
    
    required init(view: FeedViewProtocol) {
        self.view = view
        feedTableDataManager = FeedTableDataManager(feedTableView: view.feedTableView)
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
        feedTableDataManager.add(videos: videos)
    }
    
}
