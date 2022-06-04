//
//  PopularVideosData.swift
//  potok
//
//  Created by Никита Владимирович on 04.06.2022.
//

import Foundation

struct PopularVideosData: Decodable {
    let page: Int
    let per_page: Int
    let total_results: Int
    let url: String
    let videos: [VideoData]
}
