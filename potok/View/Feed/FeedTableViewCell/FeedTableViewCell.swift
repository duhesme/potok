//
//  FeedTableViewCell.swift
//  potok
//
//  Created by Никита Владимирович on 04.06.2022.
//

import UIKit
import AVFoundation
import Kingfisher

protocol FeedTableViewCellDelegate: AnyObject {
    func likeButtonPressed()
    func authorButtonPressed(authorURL url: URL)
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
    
    var entity: VideoEntity!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        commentsButton.setBackgroundImage(Asset.Assets.commentButton.image, for: .normal)
        shareButton.setBackgroundImage(Asset.Assets.shareButton.image, for: .normal)
        
        likeButton.addTarget(self, action: #selector(likeButtonPressed), for: .touchUpInside)
        authorDetailsButton.addTarget(self, action: #selector(authorButtonPressed), for: .touchUpInside)
        
        setUpLayoutConstraints()
        
        updateLikeButtonImage(isFavorite: false)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(withVideoEntity entity: VideoEntity) {
        self.entity = entity
        configureAVPlayer(withVideoURL: entity.videoURL, andDuration: entity.duration)
        configureAuthorButton(withauthorImageURL: entity.authorPictureURL)
        updateLikeButtonImage(isFavorite: entity.isFavorite)
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
        playerLayer.frame = UIScreen.main.bounds
        actualContentView.layer.insertSublayer(playerLayer, at: 1)
    }
    
    private func configureAuthorButton(withauthorImageURL url: URL) {
        authorDetailsButton.layer.cornerRadius = 25
        authorDetailsButton.layer.borderWidth = 2
        authorDetailsButton.layer.borderColor = UIColor.white.cgColor
        authorDetailsButton.clipsToBounds = true
        
        authorDetailsButton.kf.setBackgroundImage(with: url, for: .normal)
    }
    
    private func updateLikeButtonImage(isFavorite: Bool) {
        if isFavorite {
            likeButton.setImage(Asset.Assets.likeButtonRed.image, for: .normal)
        } else {
            likeButton.setImage(Asset.Assets.likeButton.image, for: .normal)
        }
    }
    
    func play() {
        player.play()
    }
    
    func stop() {
        player.pause()
    }
    
    @objc private func likeButtonPressed() {
        delegate?.likeButtonPressed()
    }
    
    @objc private func authorButtonPressed() {
        delegate?.authorButtonPressed(authorURL: entity.authorURL)
    }
    
}
