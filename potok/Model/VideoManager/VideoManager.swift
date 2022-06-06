//
//  VideoManager.swift
//  potok
//
//  Created by Никита Владимирович on 02.06.2022.
//

import Foundation

protocol VideoMangerDelegate: AnyObject {
    func didDownloadVideos(_ videoManager: VideoManager, videos: [VideoModel], downloadedPage page: Int, resultPerPage perPage: Int, totalVideos total: Int)
    func didFailWithErrorDownloadingUser(error: Error?)
}

class VideoManager {
    
    weak var delegate: VideoMangerDelegate?
    
    func downloadPopularVideos(page: Int = 1, videosPerPage perPage: Int = 15) {
        performRequestForPopularVideoDownloading(withStringURL: "\(K.PexelsAPI.popularVideos)?page=\(page)&per_page=\(perPage)")
    }
    
    func performRequestForPopularVideoDownloading(withStringURL stringURL: String) {
        let requestHeaders = [
            "Authorization": K.PexelsAPI.apiKey
        ]
        
        if let url = URL(string: stringURL) {
            let session = URLSession(configuration: .default)
            
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            request.allHTTPHeaderFields = requestHeaders
            
            let task = session.dataTask(with: request) { data, response, error in
                if error != nil {
                    self.delegate?.didFailWithErrorDownloadingUser(error: error)
                }
                
                guard let safeData = data else {
                    self.delegate?.didFailWithErrorDownloadingUser(error: error)
                    return
                }
                
                if let httpResponse = response as? HTTPURLResponse {
                    let statusCode = httpResponse.statusCode
                    if statusCode == 200 {
                        if let videos = self.parseJSON(safeData) {
                            self.delegate?.didDownloadVideos(self, videos: videos.videos, downloadedPage: videos.page, resultPerPage: videos.per_page, totalVideos: videos.total_results)
                        }
                    } else {
                        self.delegate?.didFailWithErrorDownloadingUser(error: error)
                    }
                }
            }
            task.resume()
        }
    }
    
    private func parseJSON(_ videoData: Data) -> PopularVideosModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(PopularVideosData.self, from: videoData)
            
            var videos = [VideoModel]()
            for video in decodedData.videos {
                if let videoURL = URL(string: video.video_files[0].link), let pictureURL = URL(string: video.video_pictures[0].picture), let authorURL = URL(string: video.user.url), let webPageURL = URL(string: video.url) {
                    videos.append(VideoModel(id: video.id, url: videoURL, webPageURL: webPageURL, duration: video.duration, authorPictureURL: pictureURL, authorURL: authorURL))
                }
            }
            
            let videosModel = PopularVideosModel(page: decodedData.page, per_page: decodedData.per_page, total_results: decodedData.total_results, videos: videos)
            
            return videosModel
        } catch {
            print(error)
            delegate?.didFailWithErrorDownloadingUser(error: error)
            return nil
        }
    }
    
}
