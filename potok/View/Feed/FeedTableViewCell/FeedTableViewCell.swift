//
//  FeedTableViewCell.swift
//  potok
//
//  Created by Никита Владимирович on 04.06.2022.
//

import UIKit
import AVFoundation

protocol FeedTableViewCellDelegate: AnyObject {
    func likeButtonPressed()
}

class FeedTableViewCell: UITableViewCell {

    class var identifier: String {
        return "FeedTableViewCell"
    }
    
    weak var delegate: FeedTableViewCellDelegate?
    
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
        likeButton.addTarget(self, action: #selector(likeButtonPressed), for: .touchUpInside)
        setUpLayoutConstraints()
        updateLikeButtonImage(isFavorite: false)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(withVideoEntity entity: VideoEntity) {
        configureAVPlayer(withVideoURL: entity.videoURL, andDuration: entity.duration)
        play()
    }
    
    private func configureAVPlayer(withVideoURL videoURL: URL, andDuration duration: Int) {
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
    }
    
    private func updateLikeButtonImage(isFavorite: Bool) {
        if isFavorite {
            likeButton.setImage(Asset.Assets.likeButtonRed.image, for: .normal)
        } else {
            likeButton.setImage(Asset.Assets.likeButton.image, for: .normal)
        }
    }
    
    private func play() {
        player.play()
    }
    
    @objc private func likeButtonPressed() {
        delegate?.likeButtonPressed()
    }
    
}
