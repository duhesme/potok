//
//  VideoData.swift
//  potok
//
//  Created by Никита Владимирович on 04.06.2022.
//

import Foundation

struct VideoData: Decodable {
    let id: Int
    let url: String
    let duration: Int
    let video_files: [VideoFileData]
}

struct VideoFileData: Decodable {
    let id: Int
    let link: String
}
