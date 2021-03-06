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
    let user: UserData
    let video_files: [VideoFileData]
    let video_pictures: [VideoPicture]
}

struct VideoFileData: Decodable {
    let id: Int
    let link: String
}

struct VideoPicture: Decodable {
    let id: Int
    let picture: String
}
