//
//  FeedTableViewCell+LayoutConstraints.swift
//  potok
//
//  Created by Никита Владимирович on 04.06.2022.
//

import SnapKit

extension FeedTableViewCell {
    
    func setUpLayoutConstraints() {
        contentView.backgroundColor = .black
        
        let actualContentView = UIView()
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
        actualContentView.addSubview(controlsStackView)
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
    }
    
}
