//
//  ViewController.swift
//  potok
//
//  Created by Никита Владимирович on 31.05.2022.
//

import UIKit

class FeedViewController: UIViewController, FeedViewProtocol {
    
    func addVideos(forIndexPaths indexPaths: [IndexPath]) {
        feedTableView.insertRows(at: indexPaths, with: .none)
    }

    var presenter: FeedPresenterProtocol!
    let assembly: FeedAssemblyProtocol = FeedAssembly()
    
    var feedTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpLayoutConstraints()
        
        assembly.assemble(withViewController: self)
        presenter.configureView()
        presenter.downloadVideos()
    }
    
}
