//
//  FeedInteractor.swift
//  potok
//
//  Created by Никита Владимирович on 03.06.2022.
//

import Foundation

class FeedInteractor: FeedInteractorProtocol {
    
    weak var presenter: FeedPresenterProtocol!
    
    var videoManager = VideoManager()
    
    required init(presenter: FeedPresenterProtocol) {
        self.presenter = presenter
//        videoManager.downloadPopularVideos()
    }
    
    func downloadVideo() {
        print("[FeedInteractor] downloading videos...")
    }
    
}
