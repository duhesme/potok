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
        playVideo()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func playVideo() {
        let videoURL = URL(string: "https://player.vimeo.com/external/296210754.hd.mp4?s=08c03c14c04f15d65901f25b542eb2305090a3d7&profile_id=175&oauth2_token_id=57447761")!
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
        playerLayer.frame = UIScreen.main.bounds //actualContentView.layer.bounds
        actualContentView.layer.insertSublayer(playerLayer, at: 1)
        player.play()
    }
    
}
