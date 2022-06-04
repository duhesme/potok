//
//  FeedTableViewCell.swift
//  potok
//
//  Created by Никита Владимирович on 04.06.2022.
//

import UIKit
import AVFoundation

class FeedTableViewCell: UITableViewCell {

    class var identifier: String {
        return "FeedTableViewCell"
    }
    
    var actualContentView = UIView()
    
    var authorDetailsButton = BounceButton()
    var likeButton          = BounceButton()
    var commentsButton      = BounceButton()
    var shareButton         = BounceButton()
    
    private var player: AVQueuePlayer!
    private var playerLayer: AVPlayerLayer!
    private var playerItem: AVPlayerItem!
    private var playerLooper: AVPlayerLooper!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpLayoutConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func playVideo() {
        let videoURL = URL(string: "https://vod-progressive.akamaized.net/exp=1654384401~acl=%2Fvimeo-prod-skyfire-std-us%2F01%2F4242%2F11%2F296210754%2F1127677370.mp4~hmac=2f357180262fcd619ee4319c137147d8e85acb844bffcb280dc2b8dc0c2e48fa/vimeo-prod-skyfire-std-us/01/4242/11/296210754/1127677370.mp4?filename=Pexels+Videos+1526909.mp4")!
        let duration = 10
        
        player = AVQueuePlayer()
        playerLayer = AVPlayerLayer(player: player)
        playerItem = AVPlayerItem(url: videoURL)
        playerLooper = AVPlayerLooper(
            player: player,
            templateItem: playerItem,
            timeRange: CMTimeRange(start: .zero, end: CMTimeMake(value: Int64(duration), timescale: 1))
        )
        playerLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
        playerLayer.frame = actualContentView.layer.bounds
        actualContentView.layer.insertSublayer(playerLayer, at: 1)
        player.play()
    }

}
