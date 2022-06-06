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
        contentView.backgroundColor = .clear
        contentView.clipsToBounds = true
        
        contentView.addSubview(actualContentView)
        
        actualContentView.backgroundColor = .clear
        actualContentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        // MARK: - Left controls
        let controlsStackView = UIStackView()
        controlsStackView.backgroundColor = .clear
        controlsStackView.spacing = 12
        controlsStackView.distribution = .fillEqually
        controlsStackView.axis = .vertical
        controlsStackView.alignment = .center
        contentView.addSubview(controlsStackView)
        controlsStackView.snp.makeConstraints { make in
            make.right.equalToSuperview().inset(8)
            make.bottom.equalToSuperview().inset(60)
            make.width.equalTo(50)
            make.height.equalTo(248)
        }
        
        let controlButtons = [authorDetailsButton, likeButton, commentsButton, shareButton]
        for button in controlButtons {
            controlsStackView.addArrangedSubview(button)
            button.backgroundColor = .clear
            button.snp.makeConstraints { make in
                make.right.left.equalToSuperview()
            }
        }
        
        actualContentView.clipsToBounds = true
        contentView.sendSubviewToBack(actualContentView)
    }
    
}
