//
//  FeedCollectionViewCell.swift
//  potok
//
//  Created by Никита Владимирович on 01.06.2022.
//

import SnapKit

class FeedCollectionViewCell: UICollectionViewCell {
    
    class var identifier: String {
        return "FeedCollectionViewCell"
    }
    
    class var nib: UINib {
        return UINib(nibName: "FeedCollectionViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpLayoutConstraints()
    }

    var authorDetailsButton = BounceButton()
    var likeButton          = BounceButton()
    var commentsButton      = BounceButton()
    var shareButton         = BounceButton()
    
    private func setUpLayoutConstraints() {
        contentView.backgroundColor = .white
        
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
