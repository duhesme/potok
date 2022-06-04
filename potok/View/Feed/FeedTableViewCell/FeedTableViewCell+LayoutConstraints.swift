//
//  FeedTableViewCell+LayoutConstraints.swift
//  potok
//
//  Created by Никита Владимирович on 04.06.2022.
//

import SnapKit
import AVFoundation

extension FeedTableViewCell {
    
    func setUpLayoutConstraints() {
        contentView.backgroundColor = .yellow
        contentView.clipsToBounds = true
        
        contentView.addSubview(actualContentView)
        
        actualContentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        // MARK: - Left controls
        let controlsStackView = UIStackView()
        controlsStackView.backgroundColor = .red
        controlsStackView.spacing = 8
        controlsStackView.distribution = .fillEqually
        controlsStackView.axis = .vertical
        controlsStackView.alignment = .center
        contentView.addSubview(controlsStackView)
        controlsStackView.snp.makeConstraints { make in
            make.right.equalToSuperview()
            make.bottom.equalToSuperview().inset(60)
            make.width.equalTo(60)
            make.height.equalTo(280)
        }
        
        let controlButtons = [authorDetailsButton, likeButton, commentsButton, shareButton]
        for button in controlButtons {
            controlsStackView.addArrangedSubview(button)
            button.backgroundColor = .purple
            button.snp.makeConstraints { make in
                make.right.left.equalToSuperview()
            }
        }
        
        actualContentView.clipsToBounds = true
        contentView.sendSubviewToBack(actualContentView)
    }
    
}
