//
//  FeedTableViewCell.swift
//  potok
//
//  Created by Никита Владимирович on 04.06.2022.
//

import UIKit

class FeedTableViewCell: UITableViewCell {

    class var identifier: String {
        return "FeedTableViewCell"
    }
    
    var authorDetailsButton = BounceButton()
    var likeButton          = BounceButton()
    var commentsButton      = BounceButton()
    var shareButton         = BounceButton()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpLayoutConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
