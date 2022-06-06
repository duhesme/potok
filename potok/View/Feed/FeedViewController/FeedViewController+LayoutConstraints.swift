//
//  FeedViewController+Constraints.swift
//  potok
//
//  Created by Никита Владимирович on 31.05.2022.
//

import Foundation
import UIKit

extension FeedViewController {
    
    func setUpLayoutConstraints() {
        feedTableView = UITableView(frame: .zero, style: .plain)
        feedTableView.rowHeight = UIScreen.main.bounds.height
        feedTableView.separatorStyle = .none
        feedTableView.isPagingEnabled = true
        feedTableView.bounces = false
        feedTableView.showsVerticalScrollIndicator = false
        feedTableView.estimatedSectionHeaderHeight = CGFloat.leastNormalMagnitude
        feedTableView.sectionHeaderHeight = CGFloat.leastNormalMagnitude
        feedTableView.estimatedSectionFooterHeight = CGFloat.leastNormalMagnitude
        feedTableView.sectionFooterHeight = CGFloat.leastNormalMagnitude
        feedTableView.contentInsetAdjustmentBehavior = .never
        feedTableView.backgroundColor = .clear
        view.addSubview(feedTableView)
        feedTableView.snp.makeConstraints { make in
            make.edges.equalTo(self.view)
        }
    }
    
}
