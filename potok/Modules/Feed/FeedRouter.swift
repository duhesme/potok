//
//  FeedRouter.swift
//  potok
//
//  Created by Никита Владимирович on 03.06.2022.
//

import Foundation
import UIKit

class FeedRouter: FeedRouterProtocol {
    
    weak var viewController: FeedViewController!
    
    required init(viewController: FeedViewController) {
        self.viewController = viewController
    }
    
    func open(AuthorWebPageByURL url: URL) {
        UIApplication.shared.open(url)
    }
    
    func open(VideoWebPageByURL url: URL) {
        UIApplication.shared.open(url)
    }
    
}
