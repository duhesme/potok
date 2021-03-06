//
//  VideoEntity.swift
//  potok
//
//  Created by Никита Владимирович on 05.06.2022.
//

import Foundation

struct VideoEntity {
    let videoURL: URL
    let webPageURL: URL
    let authorPictureURL: URL
    let authorURL: URL
    let duration: Int
    var isFavorite: Bool = false
}
