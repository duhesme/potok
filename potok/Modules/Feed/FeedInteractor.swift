//
//  FeedInteractor.swift
//  potok
//
//  Created by Никита Владимирович on 03.06.2022.
//

import Foundation

class FeedInteractor: FeedInteractorProtocol {
    
    weak var presenter: FeedPresenterProtocol!
    
    required init(presenter: FeedPresenterProtocol) {
        self.presenter = presenter
    }
    
    func downloadVideo() {
        print("[FeedInteractor] downloading videos...")
    }
    
}
