//
//  ActionManager.swift
//  potok
//
//  Created by Никита Владимирович on 06.06.2022.
//

import Foundation
import UIKit

struct ActionManager {
    
    static let shared = ActionManager()
    
    private init() {
        
    }
    
    func share(url: URL, sourceViewController viewController: UIViewController){
        UIGraphicsBeginImageContext(viewController.view.frame.size)
        viewController.view.layer.render(in: UIGraphicsGetCurrentContext()!)
        UIGraphicsEndImageContext()
        
        let objectsToShare = [url] as [Any]
        let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
        
        activityVC.popoverPresentationController?.sourceView = viewController.view
        viewController.present(activityVC, animated: true, completion: nil)
    }
    
}
