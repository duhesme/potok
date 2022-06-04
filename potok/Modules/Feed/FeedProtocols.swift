//
//  FeedProtocols.swift
//  potok
//
//  Created by Никита Владимирович on 04.06.2022.
//

import Foundation

protocol FeedViewProtocol: AnyObject {
    func addVideos()
}

protocol FeedPresenterProtocol: AnyObject {
    var router: FeedRouterProtocol! { set get }
    
    func configureView()
    func likeButtonPressed()
    func saveButtonPressed()
}

protocol FeedInteractorProtocol: AnyObject {
    func downloadVideo()
}

protocol FeedAssemblyProtocol: AnyObject {
    func assemble(withViewController viewController: FeedViewController)
}

protocol FeedRouterProtocol: AnyObject {
    func openAboutViewController()
}
