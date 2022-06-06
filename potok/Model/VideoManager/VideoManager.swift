//
//  VideoManager.swift
//  potok
//
//  Created by Никита Владимирович on 02.06.2022.
//

import Foundation

protocol VideoMangerDelegate: AnyObject {
    func didDownloadVideos(_ videoManager: VideoManager, videos: [VideoModel])
    func didFailWithErrorDownloadingUser(error: Error?)
}

class VideoManager {
    
    weak var delegate: VideoMangerDelegate?
    
    func downloadPopularVideos() {
        performRequestForPopularVideoDownloading(withStringURL: K.PexelsAPI.popularVideos)
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
                            self.delegate?.didDownloadVideos(self, videos: videos)
                        }
                    } else {
                        self.delegate?.didFailWithErrorDownloadingUser(error: error)
                    }
                }
            }
            task.resume()
        }
    }
    
    private func parseJSON(_ videoData: Data) -> [VideoModel]? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(PopularVideosData.self, from: videoData)
            
            var videos = [VideoModel]()
            for video in decodedData.videos {
                if let videoURL = URL(string: video.video_files[0].link), let pictureURL = URL(string: video.video_pictures[0].picture), let authorURL = URL(string: video.user.url) {
                    videos.append(VideoModel(id: video.id, url: videoURL, duration: video.duration, authorPictureURL: pictureURL, authorURL: authorURL))
                }
            }
            
            return videos
        } catch {
            print(error)
            delegate?.didFailWithErrorDownloadingUser(error: error)
            return nil
        }
    }
    
}
