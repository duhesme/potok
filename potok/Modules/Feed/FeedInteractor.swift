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
        videoManager.delegate = self
        downloadVideo()
    }
    
    func downloadVideo() {
        videoManager.downloadPopularVideos()
    }
    
}

extension FeedInteractor: VideoMangerDelegate {
    
    func didDownloadVideos(_ videoManager: VideoManager, videos: [VideoModel]) {
        let videoEntities = videos.map {
            return VideoEntity(videoURL: $0.url, authorURL: $0.pictureURL, duration: $0.duration)
        }
        
        presenter.add(videos: videoEntities)
    }
    
    func didFailWithErrorDownloadingUser(error: Error?) {
        
    }
    
}
