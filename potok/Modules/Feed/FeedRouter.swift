//
//  FeedRouter.swift
//  potok
//
//  Created by Никита Владимирович on 03.06.2022.
//

import Foundation

class FeedRouter: FeedRouterProtocol {
    
    weak var viewController: FeedViewController!
    
    required init(viewController: FeedViewController) {
        self.viewController = viewController
    }
    
    func openAuthorWebPage() {
        
    }
    
}
