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
        // Initialization code
        setUpConstraints()
    }

    private func setUpConstraints() {
        contentView.backgroundColor = .white
        
        let v = UIView()
        contentView.addSubview(v)
        v.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.height.width.equalTo(100)
        }
    }
    
}
