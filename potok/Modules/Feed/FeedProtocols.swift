//
//  FeedProtocols.swift
//  potok
//
//  Created by Никита Владимирович on 04.06.2022.
//

import Foundation
import UIKit

protocol FeedViewProtocol: AnyObject {
    var feedTableView: UITableView! { get }
    
    func addVideos(forIndexPaths indexPaths: [IndexPath])
}

protocol FeedPresenterProtocol: AnyObject {
    var router: FeedRouterProtocol! { set get }
    
    var videos: [VideoEntity] { get }
    
    func configureView()
    func likeButtonPressed()
    func saveButtonPressed()
    func authorButtonPressed()
    func add(videos: [VideoEntity])
    func downloadVideos()
}

protocol FeedInteractorProtocol: AnyObject {
    func downloadVideos()
}

protocol FeedAssemblyProtocol: AnyObject {
    func assemble(withViewController viewController: FeedViewController)
}

protocol FeedRouterProtocol: AnyObject {
    func openAuthorWebPage()
}
