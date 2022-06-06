//
//  PopularVideosModel.swift
//  potok
//
//  Created by Никита Владимирович on 06.06.2022.
//

import Foundation

struct PopularVideosModel {
    let page: Int
    let per_page: Int
    let total_results: Int
    let videos: [VideoModel]
}
