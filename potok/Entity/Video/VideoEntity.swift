//
//  VideoEntity.swift
//  potok
//
//  Created by Никита Владимирович on 05.06.2022.
//

import Foundation

struct VideoEntity {
    let videoURL: URL
    let authorURL: URL
    let duration: Int
    let isFavorite: Bool = false
}
