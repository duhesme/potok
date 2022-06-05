//
//  ViewController.swift
//  potok
//
//  Created by Никита Владимирович on 31.05.2022.
//

import UIKit

class FeedViewController: UIViewController, FeedViewProtocol, UITableViewDataSource {

    var presenter: FeedPresenterProtocol!
    let assembly: FeedAssemblyProtocol = FeedAssembly()
    
    var feedTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpLayoutConstraints()
        
        assembly.assemble(withViewController: self)
        presenter.configureView()
        
        feedTableView.register(FeedTableViewCell.self, forCellReuseIdentifier: FeedTableViewCell.identifier)
        feedTableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FeedTableViewCell.identifier) as! FeedTableViewCell
        return cell
    }
    
    func addVideos() {
        print("adding videos...")
    }

}
