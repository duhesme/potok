//
//  VideoManager.swift
//  potok
//
//  Created by Никита Владимирович on 02.06.2022.
//

import Foundation

protocol Foo: AnyObject {
    
}

class Bar: Foo {
    weak var delegate: Foo?
}
