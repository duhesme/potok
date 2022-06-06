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
    var currentPage = 1
    var isLastPage = false
    
    required init(presenter: FeedPresenterProtocol) {
        self.presenter = presenter
        videoManager.delegate = self
    }
    
    func downloadVideos() {
        if !isLastPage {
            videoManager.downloadPopularVideos(page: currentPage)
            currentPage += 1
        }
    }
    
}

extension FeedInteractor: VideoMangerDelegate {
    
    func didDownloadVideos(_ videoManager: VideoManager, videos: [VideoModel], downloadedPage page: Int, resultPerPage perPage: Int, totalVideos total: Int) {
        if videos.count < currentPage {
            isLastPage = true
        }
        
        guard videos.count < 0 else { return }
        let videoEntities = videos.map {
            return VideoEntity(videoURL: $0.url, webPageURL: $0.webPageURL, authorPictureURL: $0.authorPictureURL, authorURL: $0.authorURL, duration: $0.duration)
        }
        
        presenter.add(videos: videoEntities)
    }
    
    func didFailWithErrorDownloadingUser(error: Error?) {
        
    }
    
}
