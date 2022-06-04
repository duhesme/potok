//
//  FeedPresenter.swift
//  potok
//
//  Created by Никита Владимирович on 03.06.2022.
//

import Foundation



class FeedPresenter: FeedPresenterProtocol {
    
    weak var view: FeedViewProtocol!
    var interactor: FeedInteractorProtocol!
    var router: FeedRouterProtocol!
    
    required init(view: FeedViewProtocol) {
        self.view = view
    }
    
    // MARK: - FeedPresenterProtocol methods
    
    func configureView() {
        print("Initial view configuration.")
    }
    
    func likeButtonPressed() {
        
    }
    
    func saveButtonPressed() {
        
    }
    
}
