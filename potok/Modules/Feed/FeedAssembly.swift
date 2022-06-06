//
//  FeedAssembly.swift
//  potok
//
//  Created by Никита Владимирович on 03.06.2022.
//

import Foundation

class FeedAssembly: FeedAssemblyProtocol {
    
    func assemble(withViewController viewController: FeedViewController) {
        let presenter = FeedPresenter(view: viewController)
        let interactor = FeedInteractor(presenter: presenter)
        let router = FeedRouter(viewController: viewController)
        let feedTableDataManager = FeedTableDataManager(feedTableView: viewController.feedTableView)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
        presenter.feedTableDataManager = feedTableDataManager
    }
    
}
